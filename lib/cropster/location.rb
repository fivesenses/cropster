# frozen_string_literal: true

# Provides an interface to the Cropster API Location system
#
# https://cropstercore.docs.apiary.io/#reference/general/locations
#
module Cropster
  class Location < Cropster::Base
    # Find a single Location
    #
    # @param id [String] the id of the required Location
    # @return [Cropster::Response::Location]
    def location(id)
      find_by_id("locations", id).first
    end

    # Find a collection of Location objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Location objects
    def locations(opts = {})
      find_collection("locations", opts)
    end

    # Find multiple Location objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Location objects
    def locations_by_ids(ids)
      find_by_ids("locations", ids)
    end

    # POSTs a new Location to Cropster
    #
    # @param data [Hash] the new Location
    # @return [Cropster::Response::Location]
    def create_location(data)
      create("locations", data).first
    end

    # Updates an existing Location
    # Supports updating: name, city, country, street, timeZone, zip
    #
    # @param id [String] the ID of the Location to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Location]
    def update_location(id, data)
      update("locations", id, data).first
    end

    # Deletes a specific Location
    #
    # @param id [String] the ID of the Location to delete
    # @return [Boolean]
    def delete_location(id)
      delete("locations", id)
    end

    # Finds a paginated collection of Location objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Location objects
    def locations_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("locations", page_number, page_size, opts)
    end

    # Finds the next page of Location results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Location objects
    def locations_next_page(current_page, opts = {})
      find_next_page("locations", current_page, opts)
    end

    # Finds all Locations by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Location objects
    def all_locations(opts = {}, max_pages = nil)
      find_all_pages("locations", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Location", data_set(response))
        .compiled_data
    end
  end
end
