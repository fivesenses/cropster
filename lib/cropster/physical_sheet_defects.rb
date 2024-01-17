#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class PhysicalSheetDefects < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def physical_sheet_defect(id)
      find_by_id("physicalSheetDefects", id).first
    end

    def physical_sheet_defects(opts = {})
      find_collection("physicalSheetDefects", opts)
    end


    def physical_sheet_defects_by_url(url)
        get_all_by_url(url)
    end


    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalSheetDefects", data_set(response))
        .compiled_data
    end
  end
end
  