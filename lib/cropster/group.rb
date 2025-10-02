# frozen_string_literal: true

# Provides an interface to the Cropster API Group system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/groups
#
module Cropster
  class Group < Cropster::Base
    # Find a single Group
    #
    # @param id [String] the id of the required Group
    # @return [Cropster::Response::Group]
    def group(id)
      find_by_id("groups", id).first
    end

    # Find a collection of Group objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Group objects
    def groups(opts = {})
      find_collection("groups", opts)
    end

    # Find multiple Group objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Group objects
    def groups_by_ids(ids)
      find_by_ids("groups", ids)
    end

    # Updates an existing Group
    # Supports updating: name, locale, timezone
    #
    # @param id [String] the ID of the Group to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Group]
    def update_group(id, data)
      update("groups", id, data).first
    end

    # Finds a paginated collection of Group objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Group objects
    def groups_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("groups", page_number, page_size, opts)
    end

    # Finds the next page of Group results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Group objects
    def groups_next_page(current_page, opts = {})
      find_next_page("groups", current_page, opts)
    end

    # Finds all Groups by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Group objects
    def all_groups(opts = {}, max_pages = nil)
      find_all_pages("groups", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Group", data_set(response))
        .compiled_data
    end
  end
end
