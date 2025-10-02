# frozen_string_literal: true

# Provides an interface to the Cropster API Stage Record Measurement Requirements system
#
# https://cropstercore.docs.apiary.io/#reference/origin/stage-record-measurement-requirements
#
module Cropster
  class StageRecordMeasurementRequirements < Cropster::Base
    # Find a single Stage Record Measurement Requirement
    #
    # @param id [String] the id of the required Stage Record Measurement Requirement
    # @return [Cropster::Response::StageRecordMeasurementRequirements]
    def stage_record_measurement_requirement(id)
      find_by_id("stage-record-measurement-requirements", id).first
    end

    # Find a collection of Stage Record Measurement Requirement objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::StageRecordMeasurementRequirements objects
    def stage_record_measurement_requirements(opts = {})
      find_collection("stage-record-measurement-requirements", opts)
    end

    # Find multiple Stage Record Measurement Requirement objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::StageRecordMeasurementRequirements objects
    def stage_record_measurement_requirements_by_ids(ids)
      find_by_ids("stage-record-measurement-requirements", ids)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecordMeasurementRequirements", data_set(response))
        .compiled_data
    end
  end
end
