##
# Provides basic functionality for child classes to interact with the Cropster
# API.
#
module Cropster
  # Base class for all Cropster API models
  #
  # IMPORTANT: API Rate Limiting Best Practices
  # ===========================================
  # The Cropster API has rate limiting to ensure system stability.
  # Please follow these guidelines to avoid having your API access revoked:
  #
  # 1. AVOID unthrottled loops - Use pagination and batch requests
  # 2. AVOID requesting many objects by ID in loops - Use filters and multiple IDs in one request
  # 3. AVOID including too many relationships in one request - Request relationships separately when possible
  # 4. RESPECT pagination limits - Default is 50 items per page, max recommended is 100
  # 5. USE appropriate delays between requests - Default rate limit is 120 requests/minute
  #
  # Example of good practice:
  #   # Instead of: (many individual requests)
  #   ids.each { |id| client.lot(id) }
  #
  #   # Do this: (one request with multiple IDs)
  #   client.lots_by_ids(ids.join(','))
  #
  #   # Or use pagination for large datasets:
  #   lots = client.lots_paginated(page: 0, size: 50)
  #
  class Base
    attr_reader :client

    # @param client [Cropster::Client] An instance of the Cropster::Client
    # with appropriate authorization data
    def initialize(client = nil)
      @client = client.nil? ? Cropster::Client.new : client
    end

    # Finds a single object on the Cropster API
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param id [String] The ID for the requested object
    # @return `Cropster::Response::FormattedResponseItem` subclassed object
    def find_by_id(object_url, id)
      response = get("/#{object_url}/#{id}")
      handle_error(response)
      process(response)
    end

    # Finds multiple objects on the Cropster API
    #
    # @param object_url [String] The REST url for the object
    # @param ids [String] A comma separated string of ID's (eg "AA,BB")
    #
    # @return [Array] an array of the
    # Cropster::Response::FormattedResponseItem subclass objects
    def find_by_ids(object_url, ids)
      response = get("/#{object_url}/#{ids}")
      handle_error(response)
      process(response)
    end

    # Finds a collection of API objects
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param opts [Hash] options to be added to URL to filter the requests
    # @return [Array] An array of the
    # `Cropster::Response::FormattedResponseItem` subclass objects
    def find_collection(object_url, opts)
      response = get("/#{object_url}" + url_filter(object_url, opts))
      handle_error(response)
      process(response)
    end

    # Finds a paginated collection of API objects
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of the
    # `Cropster::Response::FormattedResponseItem` subclass objects
    def find_paginated_collection(object_url, page_number = 0, page_size = 50, opts = {})
      pagination_opts = opts.merge(page: { number: page_number, size: page_size })
      find_collection(object_url, pagination_opts)
    end

    # Finds the next page of results
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of the
    # `Cropster::Response::FormattedResponseItem` subclass objects
    def find_next_page(object_url, current_page, opts = {})
      find_paginated_collection(object_url, current_page + 1, nil, opts)
    end

    # Finds all objects by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param opts [Hash] options to be added to URL to filter the requests
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all
    # `Cropster::Response::FormattedResponseItem` subclass objects
    def find_all_pages(object_url, opts = {}, max_pages = nil)
      all_results = []
      page = 0

      loop do
        break if max_pages && page >= max_pages

        page_results = find_paginated_collection(object_url, page, nil, opts)
        break if page_results.empty?

        all_results.concat(page_results)
        page += 1
      end

      all_results
    end

    # POSTs data to the API via Cropster::Client
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param data [Hash] the data to be POSTed
    # @return [Object] the Cropster::Response::FormattedResponseItem subclass
    def create(object_url, data)
      response = post("/#{object_url}/", data)
      handle_error(response)
      process(response)
    end

    # PATCHes data to the API via the Cropster::Client
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param id [String] the ID of the object to be updated
    # @param data [Hash] contains the updated data for the object
    # @return [Object] the Cropster::Response::FormattedResponseItem subclass
    def update(object_url, id, data)
      response = patch("/#{object_url}/#{id}", data)
      handle_error(response)
      process(response)
    end


    # URL is passed down from the parent response. 
    def get_all_by_url(object_url)
      response = get_by_url(object_url)
      handle_error(response)
      process(response)
    end


    # A method to be overridden to process the data returned via the API
    def process(response)
    end

    # Configure rate limiting for this client instance
    #
    # @param requests_per_minute [Integer] maximum requests per minute
    # @param max_retries [Integer] maximum retry attempts for failed requests
    # @param retry_delay [Float] delay between retries in seconds
    def configure_rate_limiting(requests_per_minute = nil, max_retries = nil, retry_delay = nil)
      if requests_per_minute
        @client.instance_variable_set(:@requests_per_minute, requests_per_minute)
        @client.instance_variable_set(:@rate_limiter, Cropster::RateLimiter.new(requests_per_minute))
      end

      @client.instance_variable_set(:@max_retries, max_retries) if max_retries
      @client.instance_variable_set(:@retry_delay, retry_delay) if retry_delay
    end

    # Disable rate limiting for this client instance
    def disable_rate_limiting
      @client.instance_variable_set(:@rate_limit_enabled, false)
      @client.instance_variable_set(:@rate_limiter, nil)
    end

    # Enable rate limiting for this client instance
    def enable_rate_limiting
      @client.instance_variable_set(:@rate_limit_enabled, true)
      @client.instance_variable_set(:@rate_limiter, Cropster::RateLimiter.new(@client.instance_variable_get(:@requests_per_minute)))
    end

    protected

    # Builds the filter URL from the provided options
    #
    # @param filter [String] the object name to filter
    # @param opts [Hash] options to filter the request
    # @return [String]
    def url_filter(filter, opts = {})
      "?#{uri_options(filter, opts)}"
    end

    private

    def group_code
      @client.group_code
    end

    def data_set(response)
      @client.data_set(response)
    end

    def included_resources(response)
      @client.included_resources(response)
    end

    def response_links(response)
      @client.response_links(response)
    end

    def response_meta(response)
      @client.response_meta(response)
    end

    def response_errors(response)
      @client.response_errors(response)
    end

    def full_response(response)
      @client.full_response(response)
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    # Raises an error if the API returns an error code
    def handle_error(response)
      raise CropsterBadRequestError, response.body if response.code == 400
      raise CropsterNotFoundError, response.body if response.code == 404
      raise CropsterUnavailableError, response.body unless response.code == 200
    end

    # Perform the actual interaction with the Cropster API
    def get(url)
      @client.get(url)
    end

    def get_by_url(url)
      @client.get_by_url(url)
    end

    def post(url, data)
      @client.post(url, data)
    end

    def patch(url, data)
      @client.patch(url, data)
    end

    def base_url
      @client.base_url.to_s
    end
  end
end
