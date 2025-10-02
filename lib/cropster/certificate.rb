# frozen_string_literal: true

# Provides an interface to the Cropster API Certificate system
#
# https://cropstercore.docs.apiary.io/#reference/production/certificates
#
# Note: Certificates are read-only via the API
#
module Cropster
  class Certificate < Cropster::Base
    # Find a single Certificate
    #
    # @param id [String] the id of the required Certificate
    # @return [Cropster::Response::Certificate]
    def certificate(id)
      find_by_id("certificates", id).first
    end

    # Find a collection of Certificate objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Certificate objects
    def certificates(opts = {})
      find_collection("certificates", opts)
    end

    # Find multiple Certificate objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Certificate objects
    def certificates_by_ids(ids)
      find_by_ids("certificates", ids)
    end

    # Finds a paginated collection of Certificate objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Certificate objects
    def certificates_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("certificates", page_number, page_size, opts)
    end

    # Finds the next page of Certificate results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Certificate objects
    def certificates_next_page(current_page, opts = {})
      find_next_page("certificates", current_page, opts)
    end

    # Finds all Certificates by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Certificate objects
    def all_certificates(opts = {}, max_pages = nil)
      find_all_pages("certificates", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Certificate", data_set(response))
        .compiled_data
    end
  end
end
