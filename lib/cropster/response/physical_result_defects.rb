##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalSheetDefects < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :calculated_value,
    :count,
    :weight_amount,
    :weight_unit,

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_value = attributes[:calculatedValue]
      @count = attributes[:count]
      @weight_amount = attributes[:weight][:amount]
      @weight_unit = attributes[:weight][:unit]

    end
  end
end
  
