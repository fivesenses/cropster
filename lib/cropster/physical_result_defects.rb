# frozen_string_literal: true

# Provides an interface to the Cropster API Physical Result Defects system
#
# https://cropstercore.docs.apiary.io/#reference/physical/physical-result-defects
#
module Cropster
  class PhysicalResultDefects < Cropster::Base
    # Find a single Physical Result Defect
    #
    # @param id [String] the id of the required Physical Result Defect
    # @return [Cropster::Response::PhysicalResultDefects]
    def physical_result_defect(id)
      find_by_id("physical-result-defects", id).first
    end

    # Find a collection of Physical Result Defect objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::PhysicalResultDefects objects
    def physical_result_defects(opts = {})
      find_collection("physical-result-defects", opts)
    end

    # Find multiple Physical Result Defect objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::PhysicalResultDefects objects
    def physical_result_defects_by_ids(ids)
      find_by_ids("physical-result-defects", ids)
    end

    # POSTs a new Physical Result Defect to Cropster
    #
    # @param data [Hash] the new Physical Result Defect
    # @return [Cropster::Response::PhysicalResultDefects]
    def create_physical_result_defect(data)
      create("physical-result-defects", data).first
    end

    # Updates an existing Physical Result Defect
    # Supports updating: count, weight
    #
    # @param id [String] the ID of the Physical Result Defect to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::PhysicalResultDefects]
    def update_physical_result_defect(id, data)
      update("physical-result-defects", id, data).first
    end

    # Deletes a specific Physical Result Defect
    #
    # @param id [String] the ID of the Physical Result Defect to delete
    # @return [Boolean]
    def delete_physical_result_defect(id)
      delete("physical-result-defects", id)
    end

    # Helper method to get physical result defects by URL
    #
    # @param url [String] the URL to fetch physical result defects from
    # @return [Array] of Cropster::Response::PhysicalResultDefects objects
    def physical_result_defects_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalResultDefects", data_set(response))
        .compiled_data
    end
  end
end
