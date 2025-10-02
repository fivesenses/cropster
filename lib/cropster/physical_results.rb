# frozen_string_literal: true

# Provides an interface to the Cropster API Physical Results system
#
# https://cropstercore.docs.apiary.io/#reference/physical/physical-results
#
module Cropster
  class PhysicalResults < Cropster::Base
    # Find a single Physical Result
    #
    # @param id [String] the id of the required Physical Result
    # @return [Cropster::Response::PhysicalResults]
    def physical_result(id)
      find_by_id("physical-results", id).first
    end

    # Find a collection of Physical Result objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::PhysicalResults objects
    def physical_results(opts = {})
      find_collection("physical-results", opts)
    end

    # Find multiple Physical Result objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::PhysicalResults objects
    def physical_results_by_ids(ids)
      find_by_ids("physical-results", ids)
    end

    # POSTs a new Physical Result to Cropster
    #
    # @param data [Hash] the new Physical Result
    # @return [Cropster::Response::PhysicalResults]
    def create_physical_result(data)
      create("physical-results", data).first
    end

    # Updates an existing Physical Result
    # Supports updating: category, colorOverall, colorUniformity, comment, density,
    # evaluationDate, evaluator, greenWeight, lab, moisture, parchmentWeight,
    # peaberryScreenSizes, quakerCount, roastedWeight, screenSizeSummary, screenSizes,
    # smell, temperature, waterActivity
    #
    # @param id [String] the ID of the Physical Result to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::PhysicalResults]
    def update_physical_result(id, data)
      update("physical-results", id, data).first
    end

    # Deletes a specific Physical Result
    #
    # @param id [String] the ID of the Physical Result to delete
    # @return [Boolean]
    def delete_physical_result(id)
      delete("physical-results", id)
    end

    # Finds a paginated collection of Physical Result objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::PhysicalResults objects
    def physical_results_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("physical-results", page_number, page_size, opts)
    end

    # Finds the next page of Physical Result results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::PhysicalResults objects
    def physical_results_next_page(current_page, opts = {})
      find_next_page("physical-results", current_page, opts)
    end

    # Finds all Physical Results by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::PhysicalResults objects
    def all_physical_results(opts = {}, max_pages = nil)
      find_all_pages("physical-results", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalResults", data_set(response))
        .compiled_data
    end
  end
end
