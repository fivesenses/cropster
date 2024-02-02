##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalSheetDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :formula, :measurement_type, :position, 
    :sheet_group, 
    :physical_sheet_id,


    def load_from_data(data)
      puts "dataa #{data}"
      load_parent_data(data[:relationships][:physicalSheet])
    end

    def load_parent_data(parent)
      return if parent.nil?
      @physical_sheet_id = load_parent(parent[:data])
    end


    def load_attributes(attributes)
      return if attributes.nil?
      
      @name = attributes[:name]
      @formula = attributes[:formula]
      @measurement_type = attributes[:measurementType]
      @position = attributes[:position]
      @sheet_group = attributes[:sheetGroup]


    end
  end
end
  





