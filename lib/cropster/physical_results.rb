#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class PhysicalResults < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def physical_result(id)
      find_by_id("physicalResults", id).first
    end

    def physical_results(opts = {})
      find_collection("physicalResults", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalResults", data_set(response))
        .compiled_data
    end
  end
end