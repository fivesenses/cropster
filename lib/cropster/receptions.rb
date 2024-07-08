#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class Receptions < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def reception(id)
      find_by_id("receptions", id).first
    end

    def receptions(opts = {})
      find_collection("receptions", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("Receptions", data_set(response))
        .compiled_data
    end
  end
end
  