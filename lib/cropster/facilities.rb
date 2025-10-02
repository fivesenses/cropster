# frozen_string_literal: true

# Provides an interface to the Cropster API Facilities system
#
# https://cropstercore.docs.apiary.io/#reference/origin/facilities
#
module Cropster
  class Facilities < Cropster::Base
    # Find a single Facility
    #
    # @param id [String] the id of the required Facility
    # @return [Cropster::Response::Facilities]
    def facility(id)
      find_by_id("facilities", id).first
    end

    # Find a collection of Facility objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Facilities objects
    def facilities(opts = {})
      find_collection("facilities", opts)
    end

    # Find multiple Facility objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Facilities objects
    def facilities_by_ids(ids)
      find_by_ids("facilities", ids)
    end

    # POSTs a new Facility to Cropster
    #
    # @param data [Hash] the new Facility
    # @return [Cropster::Response::Facilities]
    def create_facility(data)
      create("facilities", data).first
    end

    # Updates an existing Facility
    # Supports updating: acronym
    #
    # @param id [String] the ID of the Facility to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Facilities]
    def update_facility(id, data)
      update("facilities", id, data).first
    end

    # Deletes a specific Facility
    #
    # @param id [String] the ID of the Facility to delete
    # @return [Boolean]
    def delete_facility(id)
      delete("facilities", id)
    end

    # Finds a paginated collection of Facility objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Facilities objects
    def facilities_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("facilities", page_number, page_size, opts)
    end

    # Finds the next page of Facility results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Facilities objects
    def facilities_next_page(current_page, opts = {})
      find_next_page("facilities", current_page, opts)
    end

    # Finds all Facilities by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Facilities objects
    def all_facilities(opts = {}, max_pages = nil)
      find_all_pages("facilities", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Facilities", data_set(response))
        .compiled_data
    end
  end
end
  