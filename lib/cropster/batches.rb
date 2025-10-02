# frozen_string_literal: true

# Provides an interface to the Cropster API Batches system
#
# https://cropstercore.docs.apiary.io/#reference/origin/batches
#
module Cropster
  class Batches < Cropster::Base
    # Find a single Batch
    #
    # @param id [String] the id of the required Batch
    # @return [Cropster::Response::Batches]
    def batch(id)
      find_by_id("batches", id).first
    end

    # Find a collection of Batch objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Batches objects
    def batches(opts = {})
      find_collection("batches", opts)
    end

    # Find multiple Batch objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Batches objects
    def batches_by_ids(ids)
      find_by_ids("batches", ids)
    end

    # POSTs a new Batch to Cropster
    #
    # @param data [Hash] the new Batch
    # @return [Cropster::Response::Batches]
    def create_batch(data)
      create("batches", data).first
    end

    # Updates an existing Batch
    # Supports updating all writable attributes including:
    # idTag, active, cropYear, finalWeight, finalWeightOverride, harvestDate,
    # intermediateWeight, intermediateWeightSourceOverride, intermediateWeightTargetOverride,
    # isPiled, millingDate, notes, part, receivedWeight, receivedWeightOverride,
    # receptionDate, storageDate
    #
    # @param id [String] the ID of the Batch to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Batches]
    def update_batch(id, data)
      update("batches", id, data).first
    end

    # Deletes a specific Batch
    #
    # @param id [String] the ID of the Batch to delete
    # @return [Boolean]
    def delete_batch(id)
      delete("batches", id)
    end

    # Finds a paginated collection of Batch objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Batches objects
    def batches_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("batches", page_number, page_size, opts)
    end

    # Finds the next page of Batch results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Batches objects
    def batches_next_page(current_page, opts = {})
      find_next_page("batches", current_page, opts)
    end

    # Finds all Batches by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Batches objects
    def all_batches(opts = {}, max_pages = nil)
      find_all_pages("batches", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Batches", data_set(response))
        .compiled_data
    end
  end
end
  