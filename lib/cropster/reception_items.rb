# frozen_string_literal: true

# Provides an interface to the Cropster API Reception Items system
#
# https://cropstercore.docs.apiary.io/#reference/origin/reception-items
#
module Cropster
  class ReceptionItems < Cropster::Base
    # Find a single Reception Item
    #
    # @param id [String] the id of the required Reception Item
    # @return [Cropster::Response::ReceptionItems]
    def reception_item(id)
      find_by_id("reception-items", id).first
    end

    # Find a collection of Reception Item objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ReceptionItems objects
    def reception_items(opts = {})
      find_collection("reception-items", opts)
    end

    # Find multiple Reception Item objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ReceptionItems objects
    def reception_items_by_ids(ids)
      find_by_ids("reception-items", ids)
    end

    # POSTs a new Reception Item to Cropster
    #
    # @param data [Hash] the new Reception Item
    # @return [Cropster::Response::ReceptionItems]
    def create_reception_item(data)
      create("reception-items", data).first
    end

    # Updates an existing Reception Item
    # Supports updating: grossWeight, part, price, priceBase, weight
    #
    # @param id [String] the ID of the Reception Item to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ReceptionItems]
    def update_reception_item(id, data)
      update("reception-items", id, data).first
    end

    # Deletes a specific Reception Item
    #
    # @param id [String] the ID of the Reception Item to delete
    # @return [Boolean]
    def delete_reception_item(id)
      delete("reception-items", id)
    end

    # Helper method to get reception items by URL
    #
    # @param url [String] the URL to fetch reception items from
    # @return [Array] of Cropster::Response::ReceptionItems objects
    def reception_items_by_url(url)
      get_all_by_url(url)
    end

    # Finds a paginated collection of Reception Item objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ReceptionItems objects
    def reception_items_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("reception-items", page_number, page_size, opts)
    end

    # Finds the next page of Reception Item results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ReceptionItems objects
    def reception_items_next_page(current_page, opts = {})
      find_next_page("reception-items", current_page, opts)
    end

    # Finds all Reception Items by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::ReceptionItems objects
    def all_reception_items(opts = {}, max_pages = nil)
      find_all_pages("reception-items", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ReceptionItems", data_set(response))
        .compiled_data
    end
  end
end
  