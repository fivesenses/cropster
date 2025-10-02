# frozen_string_literal: true

# Provides an interface to the Cropster API Lots system
#
# https://cropstercore.docs.apiary.io/#reference/production/lots
#
module Cropster
  class Lot < Cropster::Base
    # Find a single Lot
    #
    # @param id [String] the id of the required Lot
    # @return [Cropster::Response::Lot]
    def lot(id)
      find_by_id("lots", id).first
    end

    # Find a collection of Lot objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Lot objects
    def lots(opts = {})
      find_collection("lots", opts)
    end

    # Find multiple Lot objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Lot objects
    def lots_by_ids(ids)
      find_by_ids("lots", ids)
    end

    # POSTs a new Lot to the API
    #
    # @param data [Hash] the new Lot
    # @return [Cropster::Response::Lot]
    def create_lot(data)
      create("lots", data).first
    end

    # Updates an existing Lot
    # Supports updating all writable attributes including:
    # name, accepted, actualWeight, arrivalDate, consumedDate, countriesOfOrigin,
    # cropYear, erpId, expectedWeight, grade, icoNumber, location, lowStockThreshold,
    # notes, price, priceBaseUnit, processingMethods, processingStep,
    # purchaseOrderNumber, ratingNotes, salesNumber, sampleType,
    # shippingContainerNumber, trackingNumber
    #
    # @param id [String] the ID of the Lot to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Lot]
    def update_lot(id, data)
      update("lots", id, data).first
    end

    # Finds a paginated collection of Lot objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Lot objects
    def lots_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("lots", page_number, page_size, opts)
    end

    # Finds the next page of Lot results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Lot objects
    def lots_next_page(current_page, opts = {})
      find_next_page("lots", current_page, opts)
    end

    # Finds all Lots by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Lot objects
    def all_lots(opts = {}, max_pages = nil)
      find_all_pages("lots", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Lot", data_set(response))
        .compiled_data
    end
  end
end
