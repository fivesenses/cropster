# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::PhysicalSheetDefects object
module Cropster
  module Response
    class PhysicalSheetDefects < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :formula,
        :measurement_type,
        :position,
        :sheet_group

      # Relationships
      attr_accessor :physical_sheet_id

      def load_from_data(data)
        super
        load_physical_sheet(data[:relationships][:physicalSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @formula = attributes[:formula]
        @measurement_type = attributes[:measurementType]
        @position = attributes[:position]
        @sheet_group = attributes[:sheetGroup]
      end

      private

      def load_physical_sheet(physical_sheet)
        return if physical_sheet.nil? || physical_sheet[:data].nil?
        @physical_sheet_id = physical_sheet[:data][:id]
      end
    end
  end
end
