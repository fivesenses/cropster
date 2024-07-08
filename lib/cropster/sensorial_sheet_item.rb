#
# Provides an interface to the SensorialSheetItem API
#

module Cropster
  class SensorialSheetItem < Cropster::Base
    # find a single SensorialSheetItem
    # @param [String] id
    # @return [Cropster::SensorialSheetItem]
    def sensorial_sheet_item(id)
      find_by_id("sensorialSheetItems", id).first
    end

    def sensorial_sheet_items(opts = {})
      find_collection("sensorialSheetItems", opts)
    end

    # Pull data from URL given by Cropster API response.
    def sensorial_sheet_items_by_url(url)
      get_all_by_url(url)
    end


    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialSheetItem", data_set(response))
        .compiled_data
    end
  end
end
