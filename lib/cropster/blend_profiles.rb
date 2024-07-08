#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class BlendProfiles < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def blend_profile(id)
      find_by_id("blendProfiles", id).first
    end

    def blend_profiles(opts = {})
      find_collection("blendProfiles", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("BlendProfiles", data_set(response))
        .compiled_data
    end
  end
end
  