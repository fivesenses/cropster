# frozen_string_literal: true

# Provides an interface to the Cropster API Group Membership system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/group-memberships
#
# Note: Group Memberships are read-only (no create, update operations via API)
#
module Cropster
  class GroupMembership < Cropster::Base
    # Find a single Group Membership
    #
    # @param id [String] the id of the required Group Membership
    # @return [Cropster::Response::GroupMembership]
    def group_membership(id)
      find_by_id("group-memberships", id).first
    end

    # Find a collection of Group Membership objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::GroupMembership objects
    def group_memberships(opts = {})
      find_collection("group-memberships", opts)
    end

    # Find multiple Group Membership objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::GroupMembership objects
    def group_memberships_by_ids(ids)
      find_by_ids("group-memberships", ids)
    end

    # Deletes a specific Group Membership
    #
    # @param id [String] the ID of the Group Membership to delete
    # @return [Boolean]
    def delete_group_membership(id)
      delete("group-memberships", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("GroupMembership", data_set(response))
        .compiled_data
    end
  end
end
