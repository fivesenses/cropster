##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalResultDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :calculated_value, :count, :weight, :physical_result, :physical_sheet_defect

    def load_from_data(data)
      super
      @physical_result = ""
      @physical_sheet_defect = ""
      get_parent(data[:relationships][:physicalResult])
      get_sheet_defect(data[:relationships][:physicalSheetDefect])
    end

    def get_parent(item)
      @physical_result = load_parent(item[:data])
    end

    def get_sheet_defect(item)
      @physical_sheet_defect = load_parent(item[:data])
    end

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_value = attributes[:calculatedValue]
      @count = attributes[:count]
      @weight = load_weight(attributes[:weight])

    end
  end
end
  
