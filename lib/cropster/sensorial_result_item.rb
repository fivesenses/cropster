#
# Provides an interface to the SensorialResultItem API
#

module Cropster
  class SensorialResultItem < Cropster::Base
    # get a single SensorialResultItem
    # @param [String] id
    # @return [Cropster::SensorialResultItem]
    def sensorial_result_item(id)
      find_by_id("sensorialResultItems", id).first
    end

    def sensorial_result_items(opts = {})
      find_all("sensorialResultItems", opts)
    end
  end
end
