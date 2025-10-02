# frozen_string_literal: true

# Provides an interface to the Cropster API Profile Lot References system
#
# https://cropstercore.docs.apiary.io/#reference/processing/profile-lot-references
#
module Cropster
  class ProfileLotReference < Cropster::Base
    # Find a single Profile Lot Reference
    #
    # @param id [String] the id of the required Profile Lot Reference
    # @return [Cropster::Response::ProfileLotReference]
    def profile_lot_reference(id)
      find_by_id("profile-lot-references", id).first
    end

    # Find a collection of Profile Lot Reference objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProfileLotReference objects
    def profile_lot_references(opts = {})
      find_collection("profile-lot-references", opts)
    end

    # Find multiple Profile Lot Reference objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProfileLotReference objects
    def profile_lot_references_by_ids(ids)
      find_by_ids("profile-lot-references", ids)
    end

    # POSTs a new Profile Lot Reference to Cropster
    # Note: lot and profile relationships must be set and cannot be changed later
    #
    # @param data [Hash] the new Profile Lot Reference
    # @return [Cropster::Response::ProfileLotReference]
    def create_profile_lot_reference(data)
      create("profile-lot-references", data).first
    end

    # Deletes a specific Profile Lot Reference
    #
    # @param id [String] the ID of the Profile Lot Reference to delete
    # @return [Boolean]
    def delete_profile_lot_reference(id)
      delete("profile-lot-references", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProfileLotReference", data_set(response))
        .compiled_data
    end
  end
end
