#
# Provides an interface to the Cropster API for the Sensorial Descriptor
#

module Cropster
  class SensorialDescriptor < Cropster::Base
    # Find a SensorialDescriptor
    #
    # @param [String] id
    # @return [Cropster::SensorialDescriptor]
    def sensorial_descriptor(id)
      find_by_id("sensorialDescriptors", id).first
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialDescriptor", data_set(response))
        .compiled_data
    end
  end
end
