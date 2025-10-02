# frozen_string_literal: true

# Provides an interface to the Cropster API Variety system
#
# https://cropstercore.docs.apiary.io/#reference/production/varieties
#
# Note: Varieties cannot be updated or deleted once created
#
module Cropster
  class Variety < Cropster::Base
    # Find a single Variety
    #
    # @param id [String] the id of the required Variety
    # @return [Cropster::Response::Variety]
    def variety(id)
      find_by_id("varieties", id).first
    end

    # Find a collection of Variety objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Variety objects
    def varieties(opts = {})
      find_collection("varieties", opts)
    end

    # Find multiple Variety objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Variety objects
    def varieties_by_ids(ids)
      find_by_ids("varieties", ids)
    end

    # POSTs a new Variety to Cropster
    # Note: group and productType must be set and cannot be changed
    # Note: Varieties cannot be updated or deleted once created
    #
    # @param data [Hash] the new Variety with name (required), group, and productType
    # @return [Cropster::Response::Variety]
    def create_variety(data)
      create("varieties", data).first
    end

    # Finds a paginated collection of Variety objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Variety objects
    def varieties_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("varieties", page_number, page_size, opts)
    end

    # Finds the next page of Variety results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Variety objects
    def varieties_next_page(current_page, opts = {})
      find_next_page("varieties", current_page, opts)
    end

    # Finds all Varieties by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Variety objects
    def all_varieties(opts = {}, max_pages = nil)
      find_all_pages("varieties", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Variety", data_set(response))
        .compiled_data
    end
  end
end
