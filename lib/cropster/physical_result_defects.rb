#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class PhysicalResultDefects < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def physical_results_defect(id)
      find_by_id("physicalResultDefects", id).first
    end

    def physical_results_defects(opts = {})
      find_collection("physicalResultDefects", opts)
    end

    def physical_results_defects_by_url(url)
        get_all_by_url(url)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("PhysicalResultDefects", data_set(response))
        .compiled_data
    end
  end
end
  