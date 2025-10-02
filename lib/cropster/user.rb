# frozen_string_literal: true

# Provides an interface to the Cropster API User system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/users
#
module Cropster
  class User < Cropster::Base
    # Find a single User
    #
    # @param id [String] the id of the required User
    # @return [Cropster::Response::User]
    def user(id)
      find_by_id("users", id).first
    end

    # Find a collection of User objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::User objects
    def users(opts = {})
      find_collection("users", opts)
    end

    # Find multiple User objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::User objects
    def users_by_ids(ids)
      find_by_ids("users", ids)
    end

    # Updates an existing User
    # Supports updating: name, active (to delete set to false), email, locale, role, timezone, username
    #
    # @param id [String] the ID of the User to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::User]
    def update_user(id, data)
      update("users", id, data).first
    end

    # Finds a paginated collection of User objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::User objects
    def users_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("users", page_number, page_size, opts)
    end

    # Finds the next page of User results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::User objects
    def users_next_page(current_page, opts = {})
      find_next_page("users", current_page, opts)
    end

    # Finds all Users by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::User objects
    def all_users(opts = {}, max_pages = nil)
      find_all_pages("users", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("User", data_set(response))
        .compiled_data
    end
  end
end
