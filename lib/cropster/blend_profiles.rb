# frozen_string_literal: true

# Provides an interface to the Cropster API Blend Profiles system
#
# https://cropstercore.docs.apiary.io/#reference/processing/blend-profiles
#
module Cropster
  class BlendProfiles < Cropster::Base
    # Find a single Blend Profile
    #
    # @param id [String] the id of the required Blend Profile
    # @return [Cropster::Response::BlendProfiles]
    def blend_profile(id)
      find_by_id("blend-profiles", id).first
    end

    # Find a collection of Blend Profile objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::BlendProfiles objects
    def blend_profiles(opts = {})
      find_collection("blend-profiles", opts)
    end

    # Find multiple Blend Profile objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::BlendProfiles objects
    def blend_profiles_by_ids(ids)
      find_by_ids("blend-profiles", ids)
    end

    # POSTs a new Blend Profile to Cropster
    #
    # @param data [Hash] the new Blend Profile
    # @return [Cropster::Response::BlendProfiles]
    def create_blend_profile(data)
      create("blend-profiles", data).first
    end

    # Updates an existing Blend Profile
    # Supports updating: name, isActive, isArchived
    #
    # @param id [String] the ID of the Blend Profile to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::BlendProfiles]
    def update_blend_profile(id, data)
      update("blend-profiles", id, data).first
    end

    # Deletes a specific Blend Profile
    #
    # @param id [String] the ID of the Blend Profile to delete
    # @return [Boolean]
    def delete_blend_profile(id)
      delete("blend-profiles", id)
    end

    # Finds a paginated collection of Blend Profile objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::BlendProfiles objects
    def blend_profiles_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("blend-profiles", page_number, page_size, opts)
    end

    # Finds the next page of Blend Profile results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::BlendProfiles objects
    def blend_profiles_next_page(current_page, opts = {})
      find_next_page("blend-profiles", current_page, opts)
    end

    # Finds all Blend Profiles by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::BlendProfiles objects
    def all_blend_profiles(opts = {}, max_pages = nil)
      find_all_pages("blend-profiles", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("BlendProfiles", data_set(response))
        .compiled_data
    end
  end
end
