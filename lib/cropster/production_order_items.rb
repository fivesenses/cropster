# frozen_string_literal: true

# Provides an interface to the Cropster API Production Order Items system
#
# https://cropstercore.docs.apiary.io/#reference/order/production-order-items
#
module Cropster
  class ProductionOrderItems < Cropster::Base
    # Find a single Production Order Item
    #
    # @param id [String] the id of the required Production Order Item
    # @return [Cropster::Response::ProductionOrderItems]
    def production_order_item(id)
      find_by_id("production-order-items", id).first
    end

    # Find a collection of Production Order Item objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProductionOrderItems objects
    def production_order_items(opts = {})
      find_collection("production-order-items", opts)
    end

    # Find multiple Production Order Item objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProductionOrderItems objects
    def production_order_items_by_ids(ids)
      find_by_ids("production-order-items", ids)
    end

    # POSTs a new Production Order Item to Cropster
    #
    # @param data [Hash] the new Production Order Item
    # @return [Cropster::Response::ProductionOrderItems]
    def create_production_order_item(data)
      create("production-order-items", data).first
    end

    # Updates an existing Production Order Item
    # Supports updating: format (deprecated), quantity, sku (deprecated)
    #
    # @param id [String] the ID of the Production Order Item to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProductionOrderItems]
    def update_production_order_item(id, data)
      update("production-order-items", id, data).first
    end

    # Deletes a specific Production Order Item
    #
    # @param id [String] the ID of the Production Order Item to delete
    # @return [Boolean]
    def delete_production_order_item(id)
      delete("production-order-items", id)
    end

    # Helper method to get production order items by URL
    #
    # @param url [String] the URL to fetch production order items from
    # @return [Array] of Cropster::Response::ProductionOrderItems objects
    def production_order_items_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProductionOrderItems", data_set(response))
        .compiled_data
    end
  end
end
