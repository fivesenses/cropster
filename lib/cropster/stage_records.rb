# frozen_string_literal: true

# Provides an interface to the Cropster API Stage Records system
#
# https://cropstercore.docs.apiary.io/#reference/origin/stage-records
#
module Cropster
  class StageRecords < Cropster::Base
    # Find a single Stage Record
    #
    # @param id [String] the id of the required Stage Record
    # @return [Cropster::Response::StageRecords]
    def stage_record(id)
      find_by_id("stage-records", id).first
    end

    # Find a collection of Stage Record objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::StageRecords objects
    def stage_records(opts = {})
      find_collection("stage-records", opts)
    end

    # Find multiple Stage Record objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::StageRecords objects
    def stage_records_by_ids(ids)
      find_by_ids("stage-records", ids)
    end

    # POSTs a new Stage Record to Cropster
    #
    # @param data [Hash] the new Stage Record
    # @return [Cropster::Response::StageRecords]
    def create_stage_record(data)
      create("stage-records", data).first
    end

    # Updates an existing Stage Record
    # Supports updating: endDate, startDate
    #
    # @param id [String] the ID of the Stage Record to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::StageRecords]
    def update_stage_record(id, data)
      update("stage-records", id, data).first
    end

    # Deletes a specific Stage Record
    #
    # @param id [String] the ID of the Stage Record to delete
    # @return [Boolean]
    def delete_stage_record(id)
      delete("stage-records", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecords", data_set(response))
        .compiled_data
    end
  end
end
