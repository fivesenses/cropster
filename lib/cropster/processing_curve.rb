# frozen_string_literal: true

# Provides an interface to the Cropster API Processing Curve system
#
# https://cropstercore.docs.apiary.io/#reference/processing/processing-curves
#
module Cropster
  class ProcessingCurve < Cropster::Base
    # Find a single Processing Curve
    #
    # @param id [String] the id of the required Processing Curve
    # @return [Cropster::Response::ProcessingCurve]
    def processing_curve(id)
      find_by_id("processing-curves", id).first
    end

    # Find a collection of Processing Curve objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingCurve objects
    def processing_curves(opts = {})
      find_collection("processing-curves", opts)
    end

    # Find multiple Processing Curve objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProcessingCurve objects
    def processing_curves_by_ids(ids)
      find_by_ids("processing-curves", ids)
    end

    # POSTs a new Processing Curve to Cropster
    #
    # @param data [Hash] the new Processing Curve
    # @return [Cropster::Response::ProcessingCurve]
    def create_processing_curve(data)
      create("processing-curves", data).first
    end

    # Updates an existing Processing Curve
    # Supports updating: name, unit, values
    #
    # @param id [String] the ID of the Processing Curve to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProcessingCurve]
    def update_processing_curve(id, data)
      update("processing-curves", id, data).first
    end

    # Deletes a specific Processing Curve
    #
    # @param id [String] the ID of the Processing Curve to delete
    # @return [Boolean]
    def delete_processing_curve(id)
      delete("processing-curves", id)
    end

    # Finds a paginated collection of Processing Curve objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProcessingCurve objects
    def processing_curves_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("processing-curves", page_number, page_size, opts)
    end

    # Finds the next page of Processing Curve results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProcessingCurve objects
    def processing_curves_next_page(current_page, opts = {})
      find_next_page("processing-curves", current_page, opts)
    end

    # Finds all Processing Curves by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::ProcessingCurve objects
    def all_processing_curves(opts = {}, max_pages = nil)
      find_all_pages("processing-curves", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProcessingCurve", data_set(response))
        .compiled_data
    end
  end
end
