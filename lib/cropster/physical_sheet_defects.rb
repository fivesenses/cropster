# frozen_string_literal: true

# Provides an interface to the Cropster API Physical Sheet Defects system
#
# https://cropstercore.docs.apiary.io/#reference/physical/physical-sheet-defects
#
module Cropster
  class PhysicalSheetDefects < Cropster::Base
    # Find a single Physical Sheet Defect
    #
    # @param id [String] the id of the required Physical Sheet Defect
    # @return [Cropster::Response::PhysicalSheetDefects]
    def physical_sheet_defect(id)
      find_by_id("physical-sheet-defects", id).first
    end

    # Find a collection of Physical Sheet Defect objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::PhysicalSheetDefects objects
    def physical_sheet_defects(opts = {})
      find_collection("physical-sheet-defects", opts)
    end

    # Find multiple Physical Sheet Defect objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::PhysicalSheetDefects objects
    def physical_sheet_defects_by_ids(ids)
      find_by_ids("physical-sheet-defects", ids)
    end

    # POSTs a new Physical Sheet Defect to Cropster
    #
    # @param data [Hash] the new Physical Sheet Defect
    # @return [Cropster::Response::PhysicalSheetDefects]
    def create_physical_sheet_defect(data)
      create("physical-sheet-defects", data).first
    end

    # Updates an existing Physical Sheet Defect
    # Supports updating: name, formula, measurementType, position, sheetGroup
    #
    # @param id [String] the ID of the Physical Sheet Defect to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::PhysicalSheetDefects]
    def update_physical_sheet_defect(id, data)
      update("physical-sheet-defects", id, data).first
    end

    # Deletes a specific Physical Sheet Defect
    #
    # @param id [String] the ID of the Physical Sheet Defect to delete
    # @return [Boolean]
    def delete_physical_sheet_defect(id)
      delete("physical-sheet-defects", id)
    end

    # Helper method to get physical sheet defects by URL
    #
    # @param url [String] the URL to fetch physical sheet defects from
    # @return [Array] of Cropster::Response::PhysicalSheetDefects objects
    def physical_sheet_defects_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalSheetDefects", data_set(response))
        .compiled_data
    end
  end
end
