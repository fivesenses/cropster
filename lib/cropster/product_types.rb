#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
    class ProductTypes < Cropster::Base
      # Find a single SensorialQc
      #
      # @param [String] id
      # @return [Cropster::Response::SensorialQc]
      def productType(id)
        find_by_id("productTypes", id).first
      end
  
      def productTypes(opts = {})
        find_collection("productTypes", opts)
      end
  
      def process(response)
        Cropster::Response::ResponseHandler
          .new("ProductTypes", data_set(response))
          .compiled_data
      end
    end
  end