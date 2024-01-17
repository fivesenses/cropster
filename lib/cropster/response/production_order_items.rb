##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class ProductionOrderItems < Cropster::Response::FormattedResponseItem
    attr_accessor  :format, :quantity, :sku, :variant_info

    def load_attributes(attributes)
      return if attributes.nil?
      @format = attributes[:format]
      @quantity = load_weight(attributes[:quantity])
      @sku = attributes[:sku]
      @variant_info = attributes[:variantInfo]
      
    end
  end
end
  