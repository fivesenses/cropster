#
# Provides an interface to the Cropster API for the stage Measurement Requirements module
#

module Cropster
  class StageMeasurementRequirements < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def stage_measurement_requirement(id)
      find_by_id("stageMeasurementRequirements", id).first
    end

    def stage_measurement_requirements(opts = {})
      find_collection("stageMeasurementRequirements", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageMeasurementRequirements", data_set(response))
        .compiled_data
    end
  end
end
  