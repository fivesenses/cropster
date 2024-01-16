#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class PhysicalSheets < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def physical_sheet(id)
      find_by_id("physicalSheets", id).first
    end

    def physical_sheets(opts = {})
      find_collection("physicalSheets", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalSheets", data_set(response))
        .compiled_data
    end
  end
end
  