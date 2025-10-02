# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Sheet system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-sheets
#
# Note: Only GET requests are supported by non-privileged users
#
module Cropster
  class SensorialSheet < Cropster::Base
    # Find a single Sensorial Sheet
    #
    # @param id [String] the id of the required Sensorial Sheet
    # @return [Cropster::Response::SensorialSheet]
    def sensorial_sheet(id)
      find_by_id("sensorial-sheets", id).first
    end

    # Find a collection of Sensorial Sheet objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialSheet objects
    def sensorial_sheets(opts = {})
      find_collection("sensorial-sheets", opts)
    end

    # Find multiple Sensorial Sheet objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialSheet objects
    def sensorial_sheets_by_ids(ids)
      find_by_ids("sensorial-sheets", ids)
    end

    # POSTs a new Sensorial Sheet to Cropster
    # Note: Requires privileged user access
    #
    # @param data [Hash] the new Sensorial Sheet
    # @return [Cropster::Response::SensorialSheet]
    def create_sensorial_sheet(data)
      create("sensorial-sheets", data).first
    end

    # Updates an existing Sensorial Sheet
    # Note: Requires privileged user access
    # Supports updating: name, acronym, deltaScore, languages, scoreMaximum, scoreMinimum
    #
    # @param id [String] the ID of the Sensorial Sheet to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialSheet]
    def update_sensorial_sheet(id, data)
      update("sensorial-sheets", id, data).first
    end

    # Finds a paginated collection of Sensorial Sheet objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialSheet objects
    def sensorial_sheets_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("sensorial-sheets", page_number, page_size, opts)
    end

    # Finds the next page of Sensorial Sheet results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialSheet objects
    def sensorial_sheets_next_page(current_page, opts = {})
      find_next_page("sensorial-sheets", current_page, opts)
    end

    # Finds all Sensorial Sheets by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::SensorialSheet objects
    def all_sensorial_sheets(opts = {}, max_pages = nil)
      find_all_pages("sensorial-sheets", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialSheet", data_set(response))
        .compiled_data
    end
  end
end
