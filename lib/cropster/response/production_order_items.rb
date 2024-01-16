##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class ProductionOrderItems < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :format,
    :quantity_amount,
    :quantity_unit,
    :quantity_amount_si,
    :sku,
    :variant_info,

    def load_attributes(attributes)
      return if attributes.nil?
      @format = attributes[:format]
      @quantity_amount = attributes[:quantity][:amount]
      @quantity_amount_si = attributes[:quantity][:amountSI]
      @quantity_unit = attributes[:quantity][:unit]
      @sku = attributes[:sku]
      @variant_info = attributes[:variantInfo]
      
    end
  end
end
  