#
module Cropster::Response
  class Defects < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :formula, :measurement_type, :position, :sheet_group, :physical_sheet_id,

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