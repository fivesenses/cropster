##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class ReceptionItems < Cropster::Response::FormattedResponseItem
    attr_accessor  :gross_weight_amount, :gross_weight_unit, :gross_weight_amount_si, :is_active, :part, :price_amount, :price_currency, :price_base_amount, :price_base_unit, :price_base_amount_si, :weight_amount, :weight_unit, :weight_amount_si
    
    def load_attributes(attributes)
      return if attributes.nil?
      @gross_weight_amount = attributes[:grossWeight][:amount]
      @gross_weight_unit = attributes[:grossWeight][:unit]
      @gross_weight_amount_si = attributes[:grossWeight][:amountSI]
      @is_active = attributes[:isActive]
      @part = attributes[:part]
      @price_amount = attributes[:price][:amount]
      @price_currency = attributes[:price][:currenty]
      @price_base_amount = attributes[:priceBase][:amount]
      @price_base_unit = attributes[:priceBase][:unit]
      @price_base_amount_si = attributes[:priceBase][:amountSI]
      @weight_amount = attributes[:weight][:amount]
      @weight_unit = attributes[:weight][:unit]
      @weight_amount_si = attributes[:weight][:amountSI]
      
    end
  end
end
  