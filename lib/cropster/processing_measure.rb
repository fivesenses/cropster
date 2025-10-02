# frozen_string_literal: true

# Provides an interface to the Cropster API Processing Measure system
#
# https://cropstercore.docs.apiary.io/#reference/processing/processing-measures
#
module Cropster
  class ProcessingMeasure < Cropster::Base
    # Find a single Processing Measure
    #
    # @param id [String] the id of the required Processing Measure
    # @return [Cropster::Response::ProcessingMeasure]
    def processing_measure(id)
      find_by_id("processing-measures", id).first
    end

    # Find a collection of Processing Measure objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingMeasure objects
    def processing_measures(opts = {})
      find_collection("processing-measures", opts)
    end

    # Find multiple Processing Measure objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProcessingMeasure objects
    def processing_measures_by_ids(ids)
      find_by_ids("processing-measures", ids)
    end

    # POSTs a new Processing Measure to Cropster
    #
    # @param data [Hash] the new Processing Measure
    # @return [Cropster::Response::ProcessingMeasure]
    def create_processing_measure(data)
      create("processing-measures", data).first
    end

    # Updates an existing Processing Measure
    # Supports updating: name, measure
    #
    # @param id [String] the ID of the Processing Measure to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProcessingMeasure]
    def update_processing_measure(id, data)
      update("processing-measures", id, data).first
    end

    # Deletes a specific Processing Measure
    #
    # @param id [String] the ID of the Processing Measure to delete
    # @return [Boolean]
    def delete_processing_measure(id)
      delete("processing-measures", id)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProcessingMeasure", data_set(response))
        .compiled_data
    end
  end
end
