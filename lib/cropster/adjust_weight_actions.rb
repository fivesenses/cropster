#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class AdjustWeightActions < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def adjust_weight_action(id)
      find_by_id("adjustWeightActions", id).first
    end

    def adjust_weight_actions(opts = {})
      find_collection("adjustWeightActions", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("AdjustWeightActions", data_set(response))
        .compiled_data
    end
  end
end
  