# frozen_string_literal: true

# Provides an interface to the Cropster API Machine system
#
# https://cropstercore.docs.apiary.io/#reference/processing/machines
#
module Cropster
  class Machine < Cropster::Base
    # Find a single Machine
    #
    # @param id [String] the id of the required Machine
    # @return [Cropster::Response::Machine]
    def machine(id)
      find_by_id("machines", id).first
    end

    # Find a collection of Machine objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Machine objects
    def machines(opts = {})
      find_collection("machines", opts)
    end

    # Find multiple Machine objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Machine objects
    def machines_by_ids(ids)
      find_by_ids("machines", ids)
    end

    # Updates an existing Machine
    # Supports updating: capacity, erpId, forSamples, identifier, supportedMeasures, location
    #
    # @param id [String] the ID of the Machine to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Machine]
    def update_machine(id, data)
      update("machines", id, data).first
    end

    # Finds a paginated collection of Machine objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Machine objects
    def machines_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("machines", page_number, page_size, opts)
    end

    # Finds the next page of Machine results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Machine objects
    def machines_next_page(current_page, opts = {})
      find_next_page("machines", current_page, opts)
    end

    # Finds all Machines by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Machine objects
    def all_machines(opts = {}, max_pages = nil)
      find_all_pages("machines", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Machine", data_set(response))
        .compiled_data
    end
  end
end
