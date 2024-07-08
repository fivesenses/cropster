#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class Classifications < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def classification(id)
      find_by_id("classifications", id).first
    end

    def classifications(opts = {})
      find_collection("classifications", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Classifications", data_set(response))
        .compiled_data
    end
  end
end
  