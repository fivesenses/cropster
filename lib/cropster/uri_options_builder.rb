#
# A class to build the querystring for the URI
#

module Cropster
  class UriOptionsBuilder
    DEFAULT_PAGE_SIZE = 50
    attr_reader :uri

    def initialize(filter_type, opts, group_code)
      @sort_opts = nil
      @filter_opts = nil
      @page_opts = nil
      @include_opts = nil
      @filter_type = filter_type
      @opts = opts
      @group_code = group_code

      build_options
    end

    def build_options
      build_filter_options
      build_sort_options
      build_page_options
      build_include_options
      build_uri
    end

    def build_filter_options
      @filter_opts = if @opts.has_key?(:filter) || @opts.has_key?("filter")
        {
          filter: {
            @filter_type => @opts[:filter].merge({group: @group_code})
          }
        }.to_query
      else
        {
          filter: {
            @filter_type => {group: @group_code}
          }
        }.to_query
      end
    end

    def build_sort_options
      if @opts.has_key?(:sort)
        @sort_opts = {sort: {@filter_type => @opts[:sort]}}.to_query
      end
    end

    def build_page_options
      return unless @opts.has_key?(:page) || @opts.has_key?("page")
      
      page_params = @opts[:page].dup
      
      # Remove nil values to prevent empty query parameters (e.g., page[size]=)
      page_params.reject! { |_k, v| v.nil? }
      
      # Add default page size if not specified (after nil values have been removed)
      page_params[:size] ||= DEFAULT_PAGE_SIZE
      
      @page_opts = {page: page_params}.to_query
    end

    def build_include_options
      if @opts.has_key?(:include) || @opts.has_key?("include")
        @include_opts = {include: {@filter_type => @opts[:include]}}.to_query
      end
    end

    def build_uri
      @uri = [@filter_opts, @sort_opts, @page_opts, @include_opts].compact.join("&")
    end
  end
end
