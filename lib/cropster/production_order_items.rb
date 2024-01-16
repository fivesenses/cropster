#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class ProductionOrderItems < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def production_order_item(id)
      find_by_id("productionOrderItems", id).first
    end

    def production_order_items(opts = {})
      find_collection("productionOrderItems", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProductionOrderItems", data_set(response))
        .compiled_data
    end
  end
end
  