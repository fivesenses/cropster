##
# An object to hold authentication data and to provide the transport mechanism
# for interacting with the Cropster API
#
module Cropster
  class Client
    attr_reader :api_key, :api_secret, :group_code, :user_agent, :rate_limiter

    # Constructor
    # @param opts [Hash] the authentication information for Cropster
    def initialize(opts = {})
      @test_mode = opts[:test_mode] ||= false
      @api_path = opts[:api_path] ||= Cropster::API_PATH
      @api_key = opts[:api_key] ||= ENV["CROPSTER_API_KEY"]
      @api_secret = opts[:api_secret] ||= ENV["CROPSTER_API_SECRET"]
      @group_code = opts[:group_code] ||= ENV["CROPSTER_GROUP_CODE"]
      @user_agent = opts[:user_agent] ||= "#{Cropster::DEFAULT_USER_AGENT}/#{Cropster::VERSION}"

      # Rate limiting configuration
      @rate_limit_enabled = opts[:rate_limit] != false # Default: enabled
      @requests_per_minute = opts[:requests_per_minute] ||= Cropster::DEFAULT_REQUESTS_PER_MINUTE
      @rate_limiter = RateLimiter.new(@requests_per_minute) if @rate_limit_enabled

      # Retry configuration
      @max_retries = opts[:max_retries] ||= Cropster::DEFAULT_MAX_RETRIES
      @retry_delay = opts[:retry_delay] ||= Cropster::DEFAULT_RETRY_DELAY
    end

    # Helper method to build the URL for accessing Cropster
    def base_url
      "#{host}#{@api_path}"
    end

    # Perform the HTTP GET request
    #
    # @param url [String] the url to GET
    # @return [Typhoeus::Response]
    def get(url)
      make_request do
        Typhoeus::Request.get(
          base_url + url,
          userpwd: authentication,
          headers: request_headers
        )
      end
    end

    # Perform the HTTP GET request
    #
    # @param url [String] the url to GET, overwrites the base_url as we passing the api
    # url provided by the api response from Cropster. Used only for Items calls.
    # @return [Typhoeus::Response]
    def get_by_url(url)
      make_request do
        Typhoeus::Request.get(
          url,
          userpwd: authentication,
          headers: request_headers
        )
      end
    end

    # Perform the HTTP POST request
    #
    # @param url [String] the url to POST data to
    # @param data [Hash] the data to POST
    # @return Typhoeus::Response
    def post(url, data)
      make_request do
        Typhoeus::Request.post(
          base_url + url,
          body: data.to_json,
          userpwd: authentication,
          headers: request_headers.merge(content_type_headers)
        )
      end
    end

    # Perform the HTTP PATCH request
    #
    # @param url [String] the url to post data to
    # @param data [Hash] the update data
    # @return Typhoeus::Response
    def patch(url, data)
      make_request do
        Typhoeus::Request.patch(
          base_url + url,
          body: data.to_json,
          userpwd: authentication,
          headers: request_headers.merge(content_type_headers)
        )
      end
    end

    # Extract the data from the response
    #
    # @param response [Typoeus::Response]
    def data_set(response)
      JSON.parse(response.body)[Cropster::RESPONSE_DATA_KEY]
    end

    # Extract the included resources from the response
    #
    # @param response [Typoeus::Response]
    def included_resources(response)
      JSON.parse(response.body)[Cropster::RESPONSE_INCLUDED_KEY]
    end

    # Extract the links from the response
    #
    # @param response [Typoeus::Response]
    def response_links(response)
      JSON.parse(response.body)[Cropster::RESPONSE_LINKS_KEY]
    end

    # Extract the metadata from the response
    #
    # @param response [Typoeus::Response]
    def response_meta(response)
      JSON.parse(response.body)[Cropster::RESPONSE_META_KEY]
    end

    # Extract the errors from the response
    #
    # @param response [Typoeus::Response]
    def response_errors(response)
      JSON.parse(response.body)[Cropster::RESPONSE_ERRORS_KEY]
    end

    # Parse and return the full JSON API response
    #
    # @param response [Typoeus::Response]
    def full_response(response)
      JSON.parse(response.body)
    end

    # Builds the filter URL from the provided options
    #
    # @param filter [String] the object name to filter
    # @param opts [Hash] options to filter the request
    # @return [String]
    def uri_options(filter_type, opts)
      Cropster::UriOptionsBuilder.new(filter_type, opts, @group_code).uri
    end

    protected

    def authentication
      "#{@api_key}:#{@api_secret}"
    end

    def host
      @test_mode ? Cropster::SERVER_TEST : Cropster::SERVER_PRODUCTION
    end

    # Headers required for all API requests
    def request_headers
      {
        'User-Agent' => @user_agent,
        'Accept' => Cropster::JSON_API_MEDIA_TYPE
      }
    end

    # Headers for requests that send JSON data
    def content_type_headers
      {
        'Content-Type' => Cropster::JSON_API_MEDIA_TYPE
      }
    end

    # Make a request with rate limiting and retry logic
    def make_request
      # Apply rate limiting if enabled
      @rate_limiter&.wait_for_slot if @rate_limit_enabled

      # Make the request with retry logic
      attempt = 0
      loop do
        attempt += 1
        begin
          response = yield

          # Check for rate limiting errors (HTTP 429)
          if response.code == 429 && attempt <= @max_retries
            sleep(@retry_delay * attempt) # Exponential backoff
            next # Retry the loop
          end

          return response
        rescue => e
          if attempt <= @max_retries
            sleep(@retry_delay * attempt)
            next # Retry the loop
          else
            raise e
          end
        end
      end
    end
  end

  # Simple rate limiter to prevent API abuse
  class RateLimiter
    def initialize(requests_per_minute)
      @requests_per_minute = requests_per_minute
      @interval = 60.0 / requests_per_minute
      @last_request_time = nil
    end

    def wait_for_slot
      if @last_request_time
        elapsed = Time.now - @last_request_time
        sleep(@interval - elapsed) if elapsed < @interval
      end
      @last_request_time = Time.now
    end
  end
end
