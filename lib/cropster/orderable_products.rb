# frozen_string_literal: true

# Provides an interface to the Cropster API Orderable Products system
#
# https://cropstercore.docs.apiary.io/#reference/order/orderable-products
#
module Cropster
  class OrderableProducts < Cropster::Base
    # Find a single Orderable Product
    #
    # @param id [String] the id of the required Orderable Product
    # @return [Cropster::Response::OrderableProducts]
    def orderable_product(id)
      find_by_id("orderable-products", id).first
    end

    # Find a collection of Orderable Product objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::OrderableProducts objects
    def orderable_products(opts = {})
      find_collection("orderable-products", opts)
    end

    # Find multiple Orderable Product objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::OrderableProducts objects
    def orderable_products_by_ids(ids)
      find_by_ids("orderable-products", ids)
    end

    # POSTs a new Orderable Product to Cropster
    #
    # @param data [Hash] the new Orderable Product
    # @return [Cropster::Response::OrderableProducts]
    def create_orderable_product(data)
      create("orderable-products", data).first
    end

    # Updates an existing Orderable Product
    # Supports updating: name, externalId (deprecated), isArchived, isIgnored (deprecated),
    # isProductBundle, isUnreviewed, notes, onHandInventory (deprecated)
    #
    # @param id [String] the ID of the Orderable Product to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::OrderableProducts]
    def update_orderable_product(id, data)
      update("orderable-products", id, data).first
    end

    # Deletes a specific Orderable Product
    #
    # @param id [String] the ID of the Orderable Product to delete
    # @return [Boolean]
    def delete_orderable_product(id)
      delete("orderable-products", id)
    end

    # Finds a paginated collection of Orderable Product objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::OrderableProducts objects
    def orderable_products_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("orderable-products", page_number, page_size, opts)
    end

    # Finds the next page of Orderable Product results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::OrderableProducts objects
    def orderable_products_next_page(current_page, opts = {})
      find_next_page("orderable-products", current_page, opts)
    end

    # Finds all Orderable Products by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::OrderableProducts objects
    def all_orderable_products(opts = {}, max_pages = nil)
      find_all_pages("orderable-products", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("OrderableProducts", data_set(response))
        .compiled_data
    end
  end
end
