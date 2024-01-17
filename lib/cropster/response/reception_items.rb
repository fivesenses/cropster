##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class ReceptionItems < Cropster::Response::FormattedResponseItem
    attr_accessor   :is_active, :part,  :price_currency, :gross_weight,:price,:price_base,:weight

    def load_attributes(attributes)
      return if attributes.nil?
      
      @is_active = attributes[:isActive]
      @part = attributes[:part]
      
      @gross_weight = load_weight(attributes[:grossWeight])
      @price = load_weight(attributes[:price])
      @price_base = load_weight(attributes[:priceBase])
      @weight = load_weight(attributes[:weight])

      @price_currency = attributes[:price][:currenty]

    end
  end
end
  