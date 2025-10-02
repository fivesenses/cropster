# frozen_string_literal: true

# Provides an interface to the Cropster API Batch Mixes system
#
# https://cropstercore.docs.apiary.io/#reference/origin/batch-mixes
#
module Cropster
  class BatchMixes < Cropster::Base
    # Find a single Batch Mix
    #
    # @param id [String] the id of the required Batch Mix
    # @return [Cropster::Response::BatchMixes]
    def batch_mix(id)
      find_by_id("batch-mixes", id).first
    end

    # Find a collection of Batch Mix objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::BatchMixes objects
    def batch_mixes(opts = {})
      find_collection("batch-mixes", opts)
    end

    # Find multiple Batch Mix objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::BatchMixes objects
    def batch_mixes_by_ids(ids)
      find_by_ids("batch-mixes", ids)
    end

    # POSTs a new Batch Mix to Cropster
    #
    # @param data [Hash] the new Batch Mix
    # @return [Cropster::Response::BatchMixes]
    def create_batch_mix(data)
      create("batch-mixes", data).first
    end

    # Updates an existing Batch Mix
    # Supports updating: name
    #
    # @param id [String] the ID of the Batch Mix to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::BatchMixes]
    def update_batch_mix(id, data)
      update("batch-mixes", id, data).first
    end

    # Deletes a specific Batch Mix
    #
    # @param id [String] the ID of the Batch Mix to delete
    # @return [Boolean]
    def delete_batch_mix(id)
      delete("batch-mixes", id)
    end

    # Finds a paginated collection of Batch Mix objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::BatchMixes objects
    def batch_mixes_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("batch-mixes", page_number, page_size, opts)
    end

    # Finds the next page of Batch Mix results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::BatchMixes objects
    def batch_mixes_next_page(current_page, opts = {})
      find_next_page("batch-mixes", current_page, opts)
    end

    # Finds all Batch Mixes by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::BatchMixes objects
    def all_batch_mixes(opts = {}, max_pages = nil)
      find_all_pages("batch-mixes", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("BatchMixes", data_set(response))
        .compiled_data
    end
  end
end
  