##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalResultDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :calculated_value, :count, :weight, :physical_result, :physical_sheet_defect



    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_value = attributes[:calculatedValue]
      @count = attributes[:count]
      @weight = load_weight(attributes[:weight])

    end
  end
end
  
