# frozen_string_literal: true

# Provides an interface to the Cropster API Flavor system
#
# https://cropstercore.docs.apiary.io/#reference/quality/flavors
#
module Cropster
  class Flavor < Cropster::Base
    # Find a single Flavor
    #
    # @param id [String] the id of the required Flavor
    # @return [Cropster::Response::Flavor]
    def flavor(id)
      find_by_id("flavors", id).first
    end

    # Find a collection of Flavor objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Flavor objects
    def flavors(opts = {})
      find_collection("flavors", opts)
    end

    # Find multiple Flavor objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Flavor objects
    def flavors_by_ids(ids)
      find_by_ids("flavors", ids)
    end

    # POSTs a new Flavor to Cropster
    # Note: Can only create group-specific flavors via API (not global flavors)
    #
    # @param data [Hash] the new Flavor with name, group, and productType
    # @return [Cropster::Response::Flavor]
    def create_flavor(data)
      create("flavors", data).first
    end

    # Updates an existing Flavor
    # Supports updating: name, isDirty, isPositive
    #
    # @param id [String] the ID of the Flavor to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Flavor]
    def update_flavor(id, data)
      update("flavors", id, data).first
    end

    # Deletes a specific Flavor
    #
    # @param id [String] the ID of the Flavor to delete
    # @return [Boolean]
    def delete_flavor(id)
      delete("flavors", id)
    end

    # Finds a paginated collection of Flavor objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Flavor objects
    def flavors_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("flavors", page_number, page_size, opts)
    end

    # Finds the next page of Flavor results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Flavor objects
    def flavors_next_page(current_page, opts = {})
      find_next_page("flavors", current_page, opts)
    end

    # Finds all Flavors by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Flavor objects
    def all_flavors(opts = {}, max_pages = nil)
      find_all_pages("flavors", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Flavor", data_set(response))
        .compiled_data
    end
  end
end
