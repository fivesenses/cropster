#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class ReceptionItems < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def reception_item(id)
      find_by_id("receptionItems", id).first
    end

    def reception_items(opts = {})
      find_collection("receptionItems", opts)
    end

    def reception_items_by_url(url)
        get_all_by_url(url)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("ReceptionItems", data_set(response))
        .compiled_data
    end
  end
end
  