# frozen_string_literal: true

# Provides an interface to the Cropster API Receptions system
#
# https://cropstercore.docs.apiary.io/#reference/origin/receptions
#
module Cropster
  class Receptions < Cropster::Base
    # Find a single Reception
    #
    # @param id [String] the id of the required Reception
    # @return [Cropster::Response::Receptions]
    def reception(id)
      find_by_id("receptions", id).first
    end

    # Find a collection of Reception objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Receptions objects
    def receptions(opts = {})
      find_collection("receptions", opts)
    end

    # Find multiple Reception objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Receptions objects
    def receptions_by_ids(ids)
      find_by_ids("receptions", ids)
    end

    # POSTs a new Reception to Cropster
    #
    # @param data [Hash] the new Reception
    # @return [Cropster::Response::Receptions]
    def create_reception(data)
      create("receptions", data).first
    end

    # Updates an existing Reception
    # Supports updating: coffeeForm, receptionDate
    #
    # @param id [String] the ID of the Reception to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Receptions]
    def update_reception(id, data)
      update("receptions", id, data).first
    end

    # Deletes a specific Reception
    #
    # @param id [String] the ID of the Reception to delete
    # @return [Boolean]
    def delete_reception(id)
      delete("receptions", id)
    end

    # Finds a paginated collection of Reception objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Receptions objects
    def receptions_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("receptions", page_number, page_size, opts)
    end

    # Finds the next page of Reception results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Receptions objects
    def receptions_next_page(current_page, opts = {})
      find_next_page("receptions", current_page, opts)
    end

    # Finds all Receptions by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Receptions objects
    def all_receptions(opts = {}, max_pages = nil)
      find_all_pages("receptions", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Receptions", data_set(response))
        .compiled_data
    end
  end
end
