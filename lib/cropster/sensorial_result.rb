#
# PRovides an interface to the SensorialResult API
#

module Cropster
  class SensorialResult < Cropster::Base
    # Find a single SensorialResult
    # @param id [String] the id of the SensorialResult
    # @return [Cropster::SensorialResult]
    def sensorial_result(id)
      find_by_id("sensorialResults", id).first
    end

    def sensorial_results(opts = {})
      find_all("sensorialResults", opts)
    end
  end
end
