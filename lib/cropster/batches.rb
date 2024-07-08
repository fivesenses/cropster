#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class Batches < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def batch(id)
      find_by_id("batches", id).first
    end

    def batches(opts = {})
      find_collection("batches", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Batches", data_set(response))
        .compiled_data
    end
  end
end
  