# frozen_string_literal: true

# Provides an interface to the Cropster API Profile system
#
# https://cropstercore.docs.apiary.io/#reference/processing/profiles
#
module Cropster
  class Profile < Cropster::Base
    # Find a single Profile
    #
    # @param id [String] the id of the required Profile
    # @return [Cropster::Response::Profile]
    def profile(id)
      find_by_id("profiles", id).first
    end

    # Find a collection of Profile objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Profile objects
    def profiles(opts = {})
      find_collection("profiles", opts)
    end

    # Find multiple Profile objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Profile objects
    def profiles_by_ids(ids)
      find_by_ids("profiles", ids)
    end

    # POSTs a new Profile to Cropster
    #
    # @param data [Hash] the new Profile
    # @return [Cropster::Response::Profile]
    def create_profile(data)
      create("profiles", data).first
    end

    # Updates an existing Profile
    # Supports updating: name, batchSize, erpId, isArchived, newLotName, notes,
    # weightChange, profileGroup, project, restrictedMachines
    #
    # @param id [String] the ID of the Profile to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Profile]
    def update_profile(id, data)
      update("profiles", id, data).first
    end

    # Deletes a specific Profile (sets isActive to false)
    #
    # @param id [String] the ID of the Profile to delete
    # @return [Boolean]
    def delete_profile(id)
      delete("profiles", id)
    end

    # Finds a paginated collection of Profile objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Profile objects
    def profiles_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("profiles", page_number, page_size, opts)
    end

    # Finds the next page of Profile results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Profile objects
    def profiles_next_page(current_page, opts = {})
      find_next_page("profiles", current_page, opts)
    end

    # Finds all Profiles by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Profile objects
    def all_profiles(opts = {}, max_pages = nil)
      find_all_pages("profiles", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Profile", data_set(response))
        .compiled_data
    end
  end
end
