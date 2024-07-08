#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class BatchMixes < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def batch_mixe(id)
      find_by_id("batchMixes", id).first
    end

    def batch_mixes(opts = {})
      find_collection("batchMixes", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("BatchMixes", data_set(response))
        .compiled_data
    end
  end
end
  