#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class StageRecords < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def stage_record(id)
      find_by_id("stageRecords", id).first
    end

    def stage_records(opts = {})
      find_collection("stageRecords", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("StageRecords", data_set(response))
        .compiled_data
    end
  end
end
  