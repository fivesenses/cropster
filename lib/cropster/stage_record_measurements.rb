#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class StageRecordMeasurements < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def stage_record_measurement(id)
      find_by_id("stageRecordMeasurements", id).first
    end

    def stage_record_measurements(opts = {})
      find_collection("stageRecordMeasurements", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecordMeasurements", data_set(response))
        .compiled_data
    end
  end
end
  