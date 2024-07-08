#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class ProductionOrders < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def production_order(id)
      find_by_id("productionOrders", id).first
    end

    def production_orders(opts = {})
      find_collection("productionOrders", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProductionOrders", data_set(response))
        .compiled_data
    end
  end
end
  