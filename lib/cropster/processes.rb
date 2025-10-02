# frozen_string_literal: true

# Provides an interface to the Cropster API Processes system
#
# https://cropstercore.docs.apiary.io/#reference/origin/processes
#
module Cropster
  class Processes < Cropster::Base
    # Find a single Process
    #
    # @param id [String] the id of the required Process
    # @return [Cropster::Response::Processes]
    def process_by_id(id)
      find_by_id("processes", id).first
    end

    # Find a collection of Process objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Processes objects
    def processes(opts = {})
      find_collection("processes", opts)
    end

    # Find multiple Process objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Processes objects
    def processes_by_ids(ids)
      find_by_ids("processes", ids)
    end

    # POSTs a new Process to Cropster
    #
    # @param data [Hash] the new Process
    # @return [Cropster::Response::Processes]
    def create_process(data)
      create("processes", data).first
    end

    # Updates an existing Process
    # Supports updating: name, finalForm, finalWeight, intermediateForm,
    # intermediateWeightSource, intermediateWeightTarget, processingMethod,
    # receivedForm, receivedWeight
    #
    # @param id [String] the ID of the Process to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Processes]
    def update_process(id, data)
      update("processes", id, data).first
    end

    # Deletes a specific Process
    #
    # @param id [String] the ID of the Process to delete
    # @return [Boolean]
    def delete_process(id)
      delete("processes", id)
    end

    # Finds a paginated collection of Process objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Processes objects
    def processes_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("processes", page_number, page_size, opts)
    end

    # Finds the next page of Process results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Processes objects
    def processes_next_page(current_page, opts = {})
      find_next_page("processes", current_page, opts)
    end

    # Finds all Processes by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Processes objects
    def all_processes(opts = {}, max_pages = nil)
      find_all_pages("processes", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Processes", data_set(response))
        .compiled_data
    end
  end
end
  