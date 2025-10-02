# frozen_string_literal: true

# Provides an interface to the Cropster API Contact Role system
#
# https://cropstercore.docs.apiary.io/#reference/general/contact-roles
#
# Note: Contact Roles are read-only via the API
#
module Cropster
  class ContactRole < Cropster::Base
    # Find a single Contact Role
    #
    # @param id [String] the id of the required Contact Role
    # @return [Cropster::Response::ContactRole]
    def contact_role(id)
      find_by_id("contact-roles", id).first
    end

    # Find a collection of Contact Role objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ContactRole objects
    def contact_roles(opts = {})
      find_collection("contact-roles", opts)
    end

    # Find multiple Contact Role objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ContactRole objects
    def contact_roles_by_ids(ids)
      find_by_ids("contact-roles", ids)
    end

    # Finds a paginated collection of Contact Role objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ContactRole objects
    def contact_roles_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("contact-roles", page_number, page_size, opts)
    end

    # Finds the next page of Contact Role results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ContactRole objects
    def contact_roles_next_page(current_page, opts = {})
      find_next_page("contact-roles", current_page, opts)
    end

    # Finds all Contact Roles by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::ContactRole objects
    def all_contact_roles(opts = {}, max_pages = nil)
      find_all_pages("contact-roles", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ContactRole", data_set(response))
        .compiled_data
    end
  end
end

