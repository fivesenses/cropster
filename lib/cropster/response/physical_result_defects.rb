##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalResultDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :calculated_value, :count, :weight, :physical_result, :physical_sheet_defect


    def load_from_data(data)
      super
      puts "daaaaata #{data}"
      
      @physical_result = ''
      @physical_sheet_defect = ''
      load_physical_result_data(data[:relationships][:physicalResult])
      load_physical_sheet_defect_data(data[:relationships][:physicalSheetDefect])
    end

    def load_physical_result_data(parent)
      return if parent.nil?
      @physical_result = load_parent(parent[:data])
    end

    def load_physical_sheet_defect_data(parent)
      return if parent.nil?
      @physical_sheet_defect = load_parent(parent[:data])
    end


    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_value = attributes[:calculatedValue]
      @count = attributes[:count]
      @weight = load_weight(attributes[:weight])

    end
  end
end
  
