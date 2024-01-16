#
# Provides an interface to the Cropster API for the stage Measurement  module
#

module Cropster
  class OrderableProducts < Cropster::Base
    # Find a single SensorialQc
    #
    # @param [String] id
    # @return [Cropster::Response::SensorialQc]
    def orderable_product(id)
      find_by_id("orderableProducts", id).first
    end

    def orderable_products(opts = {})
      find_collection("orderableProducts", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("OrderableProducts", data_set(response))
        .compiled_data
    end
  end
end
  