# frozen_string_literal: true

# Provides an interface to the Cropster API Stage Measurement Requirements system
#
# https://cropstercore.docs.apiary.io/#reference/origin/stage-measurement-requirements
#
module Cropster
  class StageMeasurementRequirements < Cropster::Base
    # Find a single Stage Measurement Requirement
    #
    # @param id [String] the id of the required Stage Measurement Requirement
    # @return [Cropster::Response::StageMeasurementRequirements]
    def stage_measurement_requirement(id)
      find_by_id("stage-measurement-requirements", id).first
    end

    # Find a collection of Stage Measurement Requirement objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::StageMeasurementRequirements objects
    def stage_measurement_requirements(opts = {})
      find_collection("stage-measurement-requirements", opts)
    end

    # Find multiple Stage Measurement Requirement objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::StageMeasurementRequirements objects
    def stage_measurement_requirements_by_ids(ids)
      find_by_ids("stage-measurement-requirements", ids)
    end

    # POSTs a new Stage Measurement Requirement to Cropster
    #
    # @param data [Hash] the new Stage Measurement Requirement
    # @return [Cropster::Response::StageMeasurementRequirements]
    def create_stage_measurement_requirement(data)
      create("stage-measurement-requirements", data).first
    end

    # Updates an existing Stage Measurement Requirement
    # Supports updating: minimumReadings, type
    #
    # @param id [String] the ID of the Stage Measurement Requirement to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::StageMeasurementRequirements]
    def update_stage_measurement_requirement(id, data)
      update("stage-measurement-requirements", id, data).first
    end

    # Deletes a specific Stage Measurement Requirement
    #
    # @param id [String] the ID of the Stage Measurement Requirement to delete
    # @return [Boolean]
    def delete_stage_measurement_requirement(id)
      delete("stage-measurement-requirements", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageMeasurementRequirements", data_set(response))
        .compiled_data
    end
  end
end
