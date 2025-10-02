# frozen_string_literal: true

# Provides an interface to the Cropster API Source Contact system
#
# https://cropstercore.docs.apiary.io/#reference/production/source-contacts
#
# Note: Source contact data is immutable. If created in error, delete and recreate.
#
module Cropster
  class SourceContact < Cropster::Base
    # Find a single Source Contact
    #
    # @param id [String] the id of the required Source Contact
    # @return [Cropster::Response::SourceContact]
    def source_contact(id)
      find_by_id("source-contacts", id).first
    end

    # Find a collection of Source Contact objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SourceContact objects
    def source_contacts(opts = {})
      find_collection("source-contacts", opts)
    end

    # Find multiple Source Contact objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SourceContact objects
    def source_contacts_by_ids(ids)
      find_by_ids("source-contacts", ids)
    end

    # POSTs a new Source Contact to Cropster
    # Note: All relationships (contact, contactRole, lot) are required
    #
    # @param data [Hash] the new Source Contact
    # @return [Cropster::Response::SourceContact]
    def create_source_contact(data)
      create("source-contacts", data).first
    end

    # Updates an existing Source Contact
    # Note: Data should be immutable - if incorrect, delete and recreate
    #
    # @param id [String] the ID of the Source Contact to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SourceContact]
    def update_source_contact(id, data)
      update("source-contacts", id, data).first
    end

    # Deletes a specific Source Contact
    #
    # @param id [String] the ID of the Source Contact to delete
    # @return [Boolean]
    def delete_source_contact(id)
      delete("source-contacts", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SourceContact", data_set(response))
        .compiled_data
    end
  end
end
