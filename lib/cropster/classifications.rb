# frozen_string_literal: true

# Provides an interface to the Cropster API Classifications system
#
# https://cropstercore.docs.apiary.io/#reference/quality/classifications
#
module Cropster
  class Classifications < Cropster::Base
    # Find a single Classification
    #
    # @param id [String] the id of the required Classification
    # @return [Cropster::Response::Classifications]
    def classification(id)
      find_by_id("classifications", id).first
    end

    # Find a collection of Classification objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Classifications objects
    def classifications(opts = {})
      find_collection("classifications", opts)
    end

    # Find multiple Classification objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Classifications objects
    def classifications_by_ids(ids)
      find_by_ids("classifications", ids)
    end

    # POSTs a new Classification to Cropster
    #
    # @param data [Hash] the new Classification
    # @return [Cropster::Response::Classifications]
    def create_classification(data)
      create("classifications", data).first
    end

    # Updates an existing Classification
    # Supports updating: name, screen size parameters, defect criteria, cupping scores, etc.
    #
    # @param id [String] the ID of the Classification to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Classifications]
    def update_classification(id, data)
      update("classifications", id, data).first
    end

    # Deletes a specific Classification (sets isActive to false)
    #
    # @param id [String] the ID of the Classification to delete
    # @return [Boolean]
    def delete_classification(id)
      delete("classifications", id)
    end

    # Finds a paginated collection of Classification objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Classifications objects
    def classifications_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("classifications", page_number, page_size, opts)
    end

    # Finds the next page of Classification results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Classifications objects
    def classifications_next_page(current_page, opts = {})
      find_next_page("classifications", current_page, opts)
    end

    # Finds all Classifications by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Classifications objects
    def all_classifications(opts = {}, max_pages = nil)
      find_all_pages("classifications", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Classifications", data_set(response))
        .compiled_data
    end
  end
end
