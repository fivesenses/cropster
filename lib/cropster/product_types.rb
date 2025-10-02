# frozen_string_literal: true

# Provides an interface to the Cropster API Product Types system
#
# https://cropstercore.docs.apiary.io/#reference/production/product-types
#
# Note: Product Types are read-only via the API
#
module Cropster
  class ProductTypes < Cropster::Base
    # Find a single Product Type
    #
    # @param id [String] the id of the required Product Type (e.g., "coffee")
    # @return [Cropster::Response::ProductType]
    def product_type(id)
      find_by_id("product-types", id).first
    end

    # Find a collection of Product Type objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProductType objects
    def product_types(opts = {})
      find_collection("product-types", opts)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProductType", data_set(response))
        .compiled_data
    end
  end
end
