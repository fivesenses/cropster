# frozen_string_literal: true

# Provides an interface to the Cropster API Production Orders system
#
# https://cropstercore.docs.apiary.io/#reference/order/production-orders
#
module Cropster
  class ProductionOrders < Cropster::Base
    # Find a single Production Order
    #
    # @param id [String] the id of the required Production Order
    # @return [Cropster::Response::ProductionOrders]
    def production_order(id)
      find_by_id("production-orders", id).first
    end

    # Find a collection of Production Order objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProductionOrders objects
    def production_orders(opts = {})
      find_collection("production-orders", opts)
    end

    # Find multiple Production Order objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProductionOrders objects
    def production_orders_by_ids(ids)
      find_by_ids("production-orders", ids)
    end

    # POSTs a new Production Order to Cropster
    #
    # @param data [Hash] the new Production Order
    # @return [Cropster::Response::ProductionOrders]
    def create_production_order(data)
      create("production-orders", data).first
    end

    # Updates an existing Production Order
    # Supports updating: customer, customerType, externalReference, isArchived,
    # orderDate, salesPerson, status (required)
    #
    # @param id [String] the ID of the Production Order to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProductionOrders]
    def update_production_order(id, data)
      update("production-orders", id, data).first
    end

    # Finds a paginated collection of Production Order objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProductionOrders objects
    def production_orders_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("production-orders", page_number, page_size, opts)
    end

    # Finds the next page of Production Order results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::ProductionOrders objects
    def production_orders_next_page(current_page, opts = {})
      find_next_page("production-orders", current_page, opts)
    end

    # Finds all Production Orders by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::ProductionOrders objects
    def all_production_orders(opts = {}, max_pages = nil)
      find_all_pages("production-orders", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProductionOrders", data_set(response))
        .compiled_data
    end
  end
end
