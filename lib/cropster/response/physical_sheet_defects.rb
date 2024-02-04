##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalSheetDefects < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :formula, :measurement_type, :position, :sheet_group, :physical_sheet


    def load_from_data(data)
      super

      puts "PhysicalSheetDefects LOADING DATA #{data}"

      @phyiscal_sheet = ''
      phyiscal_sheet = data[:relationships][:phyiscalSheet]
      if phyiscal_sheet
       @phyiscal_sheet = phyiscal_sheet[:links][:related]
      end
      
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
  





 