#
# Provides an interface to the Cropster API for the stage Measurement Requirements module
#

module Cropster
  class stageRecordMeasurementRequirements < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def stage_record_measurement_requirement(id)
      find_by_id("stageRecordMeasurementRequirements", id).first
    end

    def stage_record_measurement_requirements(opts = {})
      find_collection("stageRecordMeasurementRequirements", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecordMeasurementRequirements", data_set(response))
        .compiled_data
    end
  end
end
  