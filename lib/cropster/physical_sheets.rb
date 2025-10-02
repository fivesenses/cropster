# frozen_string_literal: true

# Provides an interface to the Cropster API Physical Sheets system
#
# https://cropstercore.docs.apiary.io/#reference/physical/physical-sheets
#
# Note: Only GET requests are supported by non-privileged users
#
module Cropster
  class PhysicalSheets < Cropster::Base
    # Find a single Physical Sheet
    #
    # @param id [String] the id of the required Physical Sheet
    # @return [Cropster::Response::PhysicalSheets]
    def physical_sheet(id)
      find_by_id("physical-sheets", id).first
    end

    # Find a collection of Physical Sheet objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::PhysicalSheets objects
    def physical_sheets(opts = {})
      find_collection("physical-sheets", opts)
    end

    # Find multiple Physical Sheet objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::PhysicalSheets objects
    def physical_sheets_by_ids(ids)
      find_by_ids("physical-sheets", ids)
    end

    # POSTs a new Physical Sheet to Cropster
    # Note: Requires privileged user access
    #
    # @param data [Hash] the new Physical Sheet
    # @return [Cropster::Response::PhysicalSheets]
    def create_physical_sheet(data)
      create("physical-sheets", data).first
    end

    # Updates an existing Physical Sheet
    # Note: Requires privileged user access
    # Supports updating: name, isDensityCalculated, isGlobal, isParchmentCoffee,
    # isPeaberryScreenSizeEnabled, languages, screenSizeMode
    #
    # @param id [String] the ID of the Physical Sheet to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::PhysicalSheets]
    def update_physical_sheet(id, data)
      update("physical-sheets", id, data).first
    end

    # Finds a paginated collection of Physical Sheet objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::PhysicalSheets objects
    def physical_sheets_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("physical-sheets", page_number, page_size, opts)
    end

    # Finds the next page of Physical Sheet results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::PhysicalSheets objects
    def physical_sheets_next_page(current_page, opts = {})
      find_next_page("physical-sheets", current_page, opts)
    end

    # Finds all Physical Sheets by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::PhysicalSheets objects
    def all_physical_sheets(opts = {}, max_pages = nil)
      find_all_pages("physical-sheets", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalSheets", data_set(response))
        .compiled_data
    end
  end
end
