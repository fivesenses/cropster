#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
  class BlendProfileComponents < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def blend_profile_component(id)
      find_by_id("blendProfileComponents", id).first
    end

    def blend_profile_components(opts = {})
      find_collection("blendProfileComponents", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("BlendProfileComponents", data_set(response))
        .compiled_data
    end
  end
end
  