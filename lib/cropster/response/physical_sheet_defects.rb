##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalSheetDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :formula, :measurement_type, :position, :sheet_group, :physical_sheet_parent


    def load_from_data(data)
      super

      puts "Start PhysicalSheetDefects LOADING DATA #{data}"
      puts "relationships #{data[:relationships]}"
      puts "physicalSheet #{data[:relationships][:physicalSheet]}"
      puts "physicalSheet data #{data[:relationships][:physicalSheet][:data]}"
      puts "physicalSheet data id #{data[:relationships][:physicalSheet][:data][:id]}"

      @physical_sheet_parent = ''
      @physical_sheet_parent = data[:relationships][:physicalSheet][:data][:id]
      puts @physical_sheet_parent
      puts " end PhysicalSheetDefects"
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
  





 