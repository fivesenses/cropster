# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::PhysicalResultDefects object
module Cropster
  module Response
    class PhysicalResultDefects < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :calculated_value,
        :count,
        :weight

      # Relationships
      attr_accessor :physical_result_id,
        :physical_sheet_defect_id

      def load_from_data(data)
        super
        load_physical_result(data[:relationships][:physicalResult])
        load_physical_sheet_defect(data[:relationships][:physicalSheetDefect])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @calculated_value = attributes[:calculatedValue]
        @count = attributes[:count]
        @weight = load_weight(attributes[:weight])
      end

      private

      def load_physical_result(physical_result)
        return if physical_result.nil? || physical_result[:data].nil?
        @physical_result_id = physical_result[:data][:id]
      end

      def load_physical_sheet_defect(physical_sheet_defect)
        return if physical_sheet_defect.nil? || physical_sheet_defect[:data].nil?
        @physical_sheet_defect_id = physical_sheet_defect[:data][:id]
      end
    end
  end
end
