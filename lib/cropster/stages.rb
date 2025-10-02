# frozen_string_literal: true

# Provides an interface to the Cropster API Stages system
#
# https://cropstercore.docs.apiary.io/#reference/origin/stages
#
module Cropster
  class Stages < Cropster::Base
    # Find a single Stage
    #
    # @param id [String] the id of the required Stage
    # @return [Cropster::Response::Stages]
    def stage(id)
      find_by_id("stages", id).first
    end

    # Find a collection of Stage objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Stages objects
    def stages(opts = {})
      find_collection("stages", opts)
    end

    # Find multiple Stage objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Stages objects
    def stages_by_ids(ids)
      find_by_ids("stages", ids)
    end

    # POSTs a new Stage to Cropster
    #
    # @param data [Hash] the new Stage
    # @return [Cropster::Response::Stages]
    def create_stage(data)
      create("stages", data).first
    end

    # Updates an existing Stage
    # Supports updating: name, sort, targetDuration, type
    #
    # @param id [String] the ID of the Stage to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Stages]
    def update_stage(id, data)
      update("stages", id, data).first
    end

    # Deletes a specific Stage
    #
    # @param id [String] the ID of the Stage to delete
    # @return [Boolean]
    def delete_stage(id)
      delete("stages", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Stages", data_set(response))
        .compiled_data
    end
  end
end
