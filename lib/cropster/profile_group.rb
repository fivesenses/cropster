# frozen_string_literal: true

# Provides an interface to the Cropster API Profile Groups system
#
# https://cropstercore.docs.apiary.io/#reference/processing/profile-groups
#
module Cropster
  class ProfileGroups < Cropster::Base
    # Find a single Profile Group
    #
    # @param id [String] the id of the required Profile Group
    # @return [Cropster::Response::ProfileGroup]
    def profile_group(id)
      find_by_id("profile-groups", id).first
    end

    # Find a collection of Profile Group objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProfileGroup objects
    def profile_groups(opts = {})
      find_collection("profile-groups", opts)
    end

    # Find multiple Profile Group objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProfileGroup objects
    def profile_groups_by_ids(ids)
      find_by_ids("profile-groups", ids)
    end

    # POSTs a new Profile Group to Cropster
    #
    # @param data [Hash] the new Profile Group
    # @return [Cropster::Response::ProfileGroup]
    def create_profile_group(data)
      create("profile-groups", data).first
    end

    # Updates an existing Profile Group
    # Supports updating: name, isArchived, notes, defaultProfile
    #
    # @param id [String] the ID of the Profile Group to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProfileGroup]
    def update_profile_group(id, data)
      update("profile-groups", id, data).first
    end

    # Finds a paginated collection of Profile Group objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProfileGroup objects
    def profile_groups_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("profile-groups", page_number, page_size, opts)
    end

    # Finds the next page of Profile Group results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProfileGroup objects
    def profile_groups_next_page(current_page, opts = {})
      find_next_page("profile-groups", current_page, opts)
    end

    # Finds all Profile Groups by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::ProfileGroup objects
    def all_profile_groups(opts = {}, max_pages = nil)
      find_all_pages("profile-groups", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProfileGroup", data_set(response))
        .compiled_data
    end
  end
end
