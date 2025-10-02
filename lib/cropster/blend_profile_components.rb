# frozen_string_literal: true

# Provides an interface to the Cropster API Blend Profile Components system
#
# https://cropstercore.docs.apiary.io/#reference/processing/blend-profile-components
#
module Cropster
  class BlendProfileComponents < Cropster::Base
    # Find a single Blend Profile Component
    #
    # @param id [String] the id of the required Blend Profile Component
    # @return [Cropster::Response::BlendProfileComponents]
    def blend_profile_component(id)
      find_by_id("blend-profile-components", id).first
    end

    # Find a collection of Blend Profile Component objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::BlendProfileComponents objects
    def blend_profile_components(opts = {})
      find_collection("blend-profile-components", opts)
    end

    # Find multiple Blend Profile Component objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::BlendProfileComponents objects
    def blend_profile_components_by_ids(ids)
      find_by_ids("blend-profile-components", ids)
    end

    # POSTs a new Blend Profile Component to Cropster
    #
    # @param data [Hash] the new Blend Profile Component
    # @return [Cropster::Response::BlendProfileComponents]
    def create_blend_profile_component(data)
      create("blend-profile-components", data).first
    end

    # Updates an existing Blend Profile Component
    # Supports updating: percentage
    #
    # @param id [String] the ID of the Blend Profile Component to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::BlendProfileComponents]
    def update_blend_profile_component(id, data)
      update("blend-profile-components", id, data).first
    end

    # Deletes a specific Blend Profile Component
    #
    # @param id [String] the ID of the Blend Profile Component to delete
    # @return [Boolean]
    def delete_blend_profile_component(id)
      delete("blend-profile-components", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("BlendProfileComponents", data_set(response))
        .compiled_data
    end
  end
end
