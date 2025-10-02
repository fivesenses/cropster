# frozen_string_literal: true

# Provides an interface to the Cropster API Processing system
#
# https://cropstercore.docs.apiary.io/#reference/processing/processing
#
module Cropster
  class Processing < Cropster::Base
    # Find a single Processing
    #
    # @param id [String] the id of the required Processing
    # @return [Cropster::Response::Processing]
    def processing(id)
      find_by_id("processings", id).first
    end

    # Find a collection of Processing objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Processing objects
    def processings(opts = {})
      find_collection("processings", opts)
    end

    # Find multiple Processing objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Processing objects
    def processings_by_ids(ids)
      find_by_ids("processings", ids)
    end

    # Updates an existing Processing
    # Supports updating: duration, notes, startDate, worker, machine, profile
    #
    # @param id [String] the ID of the Processing to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Processing]
    def update_processing(id, data)
      update("processings", id, data).first
    end

    # Finds a paginated collection of Processing objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Processing objects
    def processings_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("processings", page_number, page_size, opts)
    end

    # Finds the next page of Processing results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Processing objects
    def processings_next_page(current_page, opts = {})
      find_next_page("processings", current_page, opts)
    end

    # Finds all Processings by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Processing objects
    def all_processings(opts = {}, max_pages = nil)
      find_all_pages("processings", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Processing", data_set(response))
        .compiled_data
    end
  end
end
