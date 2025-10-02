# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialResultItem object
module Cropster
  module Response
    class SensorialResultItem < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :calculated_quality,
        :intensity,
        :quality

      # Relationships
      attr_accessor :sensorial_descriptors,
        :sensorial_result_id,
        :sensorial_sheet_item_id

      def load_from_data(data)
        super
        load_sensorial_descriptors(data[:relationships][:sensorialDescriptors])
        load_sensorial_result(data[:relationships][:sensorialResult])
        load_sensorial_sheet_item(data[:relationships][:sensorialSheetItem])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @calculated_quality = attributes[:calculatedQuality]
        @intensity = attributes[:intensity]
        @quality = attributes[:quality]
      end

      private

      def load_sensorial_descriptors(sensorial_descriptors)
        return if sensorial_descriptors.nil? || sensorial_descriptors[:data].nil?
        @sensorial_descriptors = []
        sensorial_descriptors[:data].each do |descriptor|
          @sensorial_descriptors << descriptor[:id]
        end
      end

      def load_sensorial_result(sensorial_result)
        return if sensorial_result.nil? || sensorial_result[:data].nil?
        @sensorial_result_id = sensorial_result[:data][:id]
      end

      def load_sensorial_sheet_item(sensorial_sheet_item)
        return if sensorial_sheet_item.nil? || sensorial_sheet_item[:data].nil?
        @sensorial_sheet_item_id = sensorial_sheet_item[:data][:id]
      end
    end
  end
end
