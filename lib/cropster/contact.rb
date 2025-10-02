# frozen_string_literal: true

# Provides an interface to the Cropster API Contact system
#
# https://cropstercore.docs.apiary.io/#reference/general/contacts
#
module Cropster
  class Contact < Cropster::Base
    # Find a single Contact
    #
    # @param id [String] the id of the required Contact
    # @return [Cropster::Response::Contact]
    def contact(id)
      find_by_id("contacts", id).first
    end

    # Find a collection of Contact objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Contact objects
    def contacts(opts = {})
      find_collection("contacts", opts)
    end

    # Find multiple Contact objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Contact objects
    def contacts_by_ids(ids)
      find_by_ids("contacts", ids)
    end

    # POSTs a new Contact to Cropster
    #
    # @param data [Hash] the new Contact
    # @return [Cropster::Response::Contact]
    def create_contact(data)
      create("contacts", data).first
    end

    # Updates an existing Contact
    # Supports updating: idTag, area, association, city, companyName, country,
    # elevation, email, fax, firstName, gpsLocation, isArchived, lastName,
    # mobile, notes, phone, region, state, street, subRegion, website, zip
    #
    # @param id [String] the ID of the Contact to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Contact]
    def update_contact(id, data)
      update("contacts", id, data).first
    end

    # Finds a paginated collection of Contact objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Contact objects
    def contacts_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("contacts", page_number, page_size, opts)
    end

    # Finds the next page of Contact results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Contact objects
    def contacts_next_page(current_page, opts = {})
      find_next_page("contacts", current_page, opts)
    end

    # Finds all Contacts by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Contact objects
    def all_contacts(opts = {}, max_pages = nil)
      find_all_pages("contacts", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Contact", data_set(response))
        .compiled_data
    end
  end
end
