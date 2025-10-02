# frozen_string_literal: true

# Provides an interface to the Cropster API Profile Component system
#
# https://cropstercore.docs.apiary.io/#reference/processing/profile-components
#
module Cropster
  class ProfileComponent < Cropster::Base
    # Find a single Profile Component
    #
    # @param id [String] the id of the required Profile Component
    # @return [Cropster::Response::ProfileComponent]
    def profile_component(id)
      find_by_id("profile-components", id).first
    end

    # Find a collection of Profile Component objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProfileComponent objects
    def profile_components(opts = {})
      find_collection("profile-components", opts)
    end

    # Find multiple Profile Component objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProfileComponent objects
    def profile_components_by_ids(ids)
      find_by_ids("profile-components", ids)
    end

    # POSTs a new Profile Component to Cropster
    #
    # @param data [Hash] the new Profile Component
    # @return [Cropster::Response::ProfileComponent]
    def create_profile_component(data)
      create("profile-components", data).first
    end

    # Updates an existing Profile Component
    # Supports updating: name, percentage (value must be between 0 and 1)
    #
    # @param id [String] the ID of the Profile Component to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProfileComponent]
    def update_profile_component(id, data)
      update("profile-components", id, data).first
    end

    # Deletes a specific Profile Component
    #
    # @param id [String] the ID of the Profile Component to delete
    # @return [Boolean]
    def delete_profile_component(id)
      delete("profile-components", id)
    end

    # Helper method to get profile components by URL
    #
    # @param url [String] the URL to fetch profile components from
    # @return [Array] of Cropster::Response::ProfileComponent objects
    def profile_components_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProfileComponent", data_set(response))
        .compiled_data
    end
  end
end
