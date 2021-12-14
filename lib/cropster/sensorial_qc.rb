#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class SensorialQc < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def sensorial_qc(id)
      find_by_id("sensorialQcs", id).first
    end

    def sensorial_qcs(opts = {})
      find_collection("sensorialQcs", opts)
    end
  end
end
