#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class Facilities < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def facilitie(id)
      find_by_id("facilities", id).first
    end

    def facilities(opts = {})
      find_collection("facilities", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Facilities", data_set(response))
        .compiled_data
    end
  end
end
  