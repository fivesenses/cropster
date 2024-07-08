#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class Stages < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def stage(id)
      find_by_id("stages", id).first
    end

    def stages(opts = {})
      find_collection("stages", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Stages", data_set(response))
        .compiled_data
    end
  end
end
  