# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Result Item system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-result-items
#
module Cropster
  class SensorialResultItem < Cropster::Base
    # Find a single Sensorial Result Item
    #
    # @param id [String] the id of the required Sensorial Result Item
    # @return [Cropster::Response::SensorialResultItem]
    def sensorial_result_item(id)
      find_by_id("sensorial-result-items", id).first
    end

    # Find a collection of Sensorial Result Item objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialResultItem objects
    def sensorial_result_items(opts = {})
      find_collection("sensorial-result-items", opts)
    end

    # Find multiple Sensorial Result Item objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialResultItem objects
    def sensorial_result_items_by_ids(ids)
      find_by_ids("sensorial-result-items", ids)
    end

    # POSTs a new Sensorial Result Item to Cropster
    #
    # @param data [Hash] the new Sensorial Result Item
    # @return [Cropster::Response::SensorialResultItem]
    def create_sensorial_result_item(data)
      create("sensorial-result-items", data).first
    end

    # Updates an existing Sensorial Result Item
    # Supports updating: intensity, quality
    #
    # @param id [String] the ID of the Sensorial Result Item to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialResultItem]
    def update_sensorial_result_item(id, data)
      update("sensorial-result-items", id, data).first
    end

    # Helper method to get sensorial result items by URL
    #
    # @param url [String] the URL to fetch sensorial result items from
    # @return [Array] of Cropster::Response::SensorialResultItem objects
    def sensorial_result_items_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialResultItem", data_set(response))
        .compiled_data
    end
  end
end
