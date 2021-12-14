#
# Provides an interface to the SensorialSheet API
#

module Cropster
  class SensorialSheet < Cropster::Base
    # find a single SensorialSheet
    # @param [String] id
    # @return [Cropster::SensorialSheet]
    def sensorial_sheet(id)
      find_by_id("sensorialSheets", id).first
    end

    def sensorial_sheets(opts = {})
      find_collection("sensorialSheets", opts)
    end
  end
end
