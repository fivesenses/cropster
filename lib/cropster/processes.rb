#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class Processes < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def processe(id)
      find_by_id("processes", id).first
    end

    def processes(opts = {})
      find_collection("processes", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Processes", data_set(response))
        .compiled_data
    end
  end
end
  