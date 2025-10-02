# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Sheet Item system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-sheet-items
#
module Cropster
  class SensorialSheetItem < Cropster::Base
    # Find a single Sensorial Sheet Item
    #
    # @param id [String] the id of the required Sensorial Sheet Item
    # @return [Cropster::Response::SensorialSheetItem]
    def sensorial_sheet_item(id)
      find_by_id("sensorial-sheet-items", id).first
    end

    # Find a collection of Sensorial Sheet Item objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialSheetItem objects
    def sensorial_sheet_items(opts = {})
      find_collection("sensorial-sheet-items", opts)
    end

    # Find multiple Sensorial Sheet Item objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialSheetItem objects
    def sensorial_sheet_items_by_ids(ids)
      find_by_ids("sensorial-sheet-items", ids)
    end

    # POSTs a new Sensorial Sheet Item to Cropster
    #
    # @param data [Hash] the new Sensorial Sheet Item
    # @return [Cropster::Response::SensorialSheetItem]
    def create_sensorial_sheet_item(data)
      create("sensorial-sheet-items", data).first
    end

    # Updates an existing Sensorial Sheet Item
    # Supports updating: name, allowedFlavors, formula, grouping, hasDescriptors,
    # inputType, intensityMax, intensityMin, intensityStep, note, position,
    # qualityMax, qualityMin, qualityStep
    #
    # @param id [String] the ID of the Sensorial Sheet Item to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialSheetItem]
    def update_sensorial_sheet_item(id, data)
      update("sensorial-sheet-items", id, data).first
    end

    # Deletes a specific Sensorial Sheet Item
    #
    # @param id [String] the ID of the Sensorial Sheet Item to delete
    # @return [Boolean]
    def delete_sensorial_sheet_item(id)
      delete("sensorial-sheet-items", id)
    end

    # Helper method to get sensorial sheet items by URL
    #
    # @param url [String] the URL to fetch sensorial sheet items from
    # @return [Array] of Cropster::Response::SensorialSheetItem objects
    def sensorial_sheet_items_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialSheetItem", data_set(response))
        .compiled_data
    end
  end
end
