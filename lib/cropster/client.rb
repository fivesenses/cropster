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
      @test_mode       = opts[:test_mode] ||= false
      @api_path        = opts[:api_path] ||= Cropster::API_PATH
      @api_key         = opts[:api_key] ||= ENV['CROPSTER_API_KEY']
      @api_secret      = opts[:api_secret] ||= ENV['CROPSTER_API_SECRET']
      @group_code      = opts[:group_code] ||= ENV['CROPSTER_GROUP_CODE']
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
      Typhoeus::Request.get(base_url + url,
                            userpwd: authentication)
    end

    # Perform the HTTP POST request
    #
    # @param url [String] the url to POST data to
    # @param data [Hash] the data to POST
    # @return Typhoeus::Response
    def post(url, data)
      Typhoeus::Request.post(base_url + url,
                             body: data,
                             userpwd: authentication)
    end

    # Perform the HTTP PATCH request
    #
    # @param url [String] the url to post data to
    # @param data [Hash] the update data
    # @return Typhoeus::Response
    def patch(url, data)
      Typhoeus::Request.patch(base_url + url,
                              body: data,
                              userpwd: authentication)
    end

    # Extract the data from the response
    #
    # @param response [Typoeus::Response]
    def data_set(response)
      JSON.parse(response.body)["data"]
    rescue
      {}
    end

    # Builds the filter URL from the provided options
    #
    # @param filter [String] the object name to filter
    # @param opts [Hash] options to filter the request
    # @return [String]
    def uri_options(filter_type, opts)
      sort_opts = nil
      filter_opts = nil
      page_opts = nil

      if opts.has_key?(:sort)
        sort_opts = { sort: { filter_type => opts[:sort] } }.to_query
      end

      if opts.has_key?(:filter) || opts.has_key?("filter")
        filter_opts = { filter: { filter_type => opts[:filter].merge({ group: @group_code }) } }.to_query
        # filter_opts = build_options(:filter, filter_type, opts[:filter].merge({ group: @group_code }))
      else
        filter_opts = { filter: { filter_type => { group: @group_code } } }.to_query
      end

      if opts.has_key?(:page)
        opts[:page].to_query
      end

      # opts = opts.merge({ group: @group_code })
      [filter_opts, sort_opts, page_opts].compact.join("&")
      # URI.encode([filter_opts, sort_opts, page_opts].join("&"))
      # URI.encode(opts.map{|k,v| "filter[#{filter_type}][#{k}]=#{v}"}.join("&"))
    end

    def build_options(parameter_type, filter_type, opts)
      { parameter_type => { filter_type => opts } }.to_query
      # opts.map{|k, v| "#{parameter_type}[#{filter_type}][#{k}]=#{v}"}.join("&")
    end

    protected
    def authentication
      "#{@api_key}:#{@api_secret}"
    end

    def host
      @test_mode ?  Cropster::SERVER_TEST : Cropster::SERVER_PRODUCTION
    end
  end
end
