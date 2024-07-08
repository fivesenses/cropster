##
# An object to hold authentication data and to provide the transport mechanism
# for interacting with the Cropster API
#
module Cropster
  class Client
    attr_reader :api_key, :api_secret, :group_code

    # Constructor
    # @param opts [Hash] the authentication information for Cropster
    def initialize(opts = {})
      @test_mode = opts[:test_mode] ||= false
      @api_path = opts[:api_path] ||= Cropster::API_PATH
      @api_key = opts[:api_key] ||= ENV["CROPSTER_API_KEY"]
      @api_secret = opts[:api_secret] ||= ENV["CROPSTER_API_SECRET"]
      @group_code = opts[:group_code] ||= ENV["CROPSTER_GROUP_CODE"]
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
      Typhoeus::Request.get(
        base_url + url,
        userpwd: authentication
      )
    end

    # Perform the HTTP GET request
    #
    # @param url [String] the url to GET, overwrites the base_url as we passing the api
    # url provided by the api response from Cropster. Used only for Items calls.
    # @return [Typhoeus::Response]
    def get_by_url(url)
      Typhoeus::Request.get(
        url,
        userpwd: authentication
      )
    end

    # Perform the HTTP POST request
    #
    # @param url [String] the url to POST data to
    # @param data [Hash] the data to POST
    # @return Typhoeus::Response
    def post(url, data)
      Typhoeus::Request.post(
        base_url + url,
        body: data,
        userpwd: authentication
      )
    end

    # Perform the HTTP PATCH request
    #
    # @param url [String] the url to post data to
    # @param data [Hash] the update data
    # @return Typhoeus::Response
    def patch(url, data)
      Typhoeus::Request.patch(
        base_url + url,
        body: data,
        userpwd: authentication
      )
    end

    # Extract the data from the response
    #
    # @param response [Typoeus::Response]
    def data_set(response)
      JSON.parse(response.body)["data"]
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
        def get(endpoint)
      response = RestClient.get(endpoint, headers)
      handle_response(response)
    rescue RestClient::ExceptionWithResponse => e
      handle_error(e)
    end

    private

    def handle_response(response)
      case response.code
      when 200
        JSON.parse(response.body)
      else
        raise Error, "Unexpected response code: #{response.code}"
      end
    end

    def handle_error(error)
      case error.http_code
      when 401
        raise Error, 'Unauthorized: Invalid API key'
      when 404
        raise Error, 'Not Found: The requested resource could not be found'
      else
        raise Error, "HTTP error: #{error.http_code}"
      end
    end
  end
end
