# frozen_string_literal: true

# Provides an interface to the Cropster API Stage Record Measurements system
#
# https://cropstercore.docs.apiary.io/#reference/origin/stage-record-measurements
#
module Cropster
  class StageRecordMeasurements < Cropster::Base
    # Find a single Stage Record Measurement
    #
    # @param id [String] the id of the required Stage Record Measurement
    # @return [Cropster::Response::StageRecordMeasurements]
    def stage_record_measurement(id)
      find_by_id("stage-record-measurements", id).first
    end

    # Find a collection of Stage Record Measurement objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::StageRecordMeasurements objects
    def stage_record_measurements(opts = {})
      find_collection("stage-record-measurements", opts)
    end

    # Find multiple Stage Record Measurement objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::StageRecordMeasurements objects
    def stage_record_measurements_by_ids(ids)
      find_by_ids("stage-record-measurements", ids)
    end

    # POSTs a new Stage Record Measurement to Cropster
    #
    # @param data [Hash] the new Stage Record Measurement
    # @return [Cropster::Response::StageRecordMeasurements]
    def create_stage_record_measurement(data)
      create("stage-record-measurements", data).first
    end

    # Updates an existing Stage Record Measurement
    # Supports updating: date, type, value
    #
    # @param id [String] the ID of the Stage Record Measurement to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::StageRecordMeasurements]
    def update_stage_record_measurement(id, data)
      update("stage-record-measurements", id, data).first
    end

    # Deletes a specific Stage Record Measurement
    #
    # @param id [String] the ID of the Stage Record Measurement to delete
    # @return [Boolean]
    def delete_stage_record_measurement(id)
      delete("stage-record-measurements", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecordMeasurements", data_set(response))
        .compiled_data
    end
  end
end
