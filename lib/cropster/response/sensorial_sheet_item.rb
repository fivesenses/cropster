# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialSheetItem object
module Cropster
  module Response
    class SensorialSheetItem < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :allowed_flavors,
        :formula,
        :grouping,
        :has_descriptors,
        :has_intensity,
        :has_quality,
        :input_type,
        :intensity_max,
        :intensity_min,
        :intensity_step,
        :is_general_descriptors_item,
        :note,
        :position,
        :quality_max,
        :quality_min,
        :quality_step

      # Relationships
      attr_accessor :sensorial_sheet_id

      def load_from_data(data)
        super
        load_sensorial_sheet(data[:relationships][:sensorialSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @allowed_flavors = attributes[:allowedFlavors]
        @formula = attributes[:formula]
        @grouping = attributes[:grouping]
        @has_descriptors = attributes[:hasDescriptors]
        @has_intensity = attributes[:hasIntensity]
        @has_quality = attributes[:hasQuality]
        @input_type = attributes[:inputType]
        @intensity_max = attributes[:intensityMax]
        @intensity_min = attributes[:intensityMin]
        @intensity_step = attributes[:intensityStep]
        @is_general_descriptors_item = attributes[:isGeneralDescriptorsItem]
        @note = attributes[:note]
        @position = attributes[:position]
        @quality_max = attributes[:qualityMax]
        @quality_min = attributes[:qualityMin]
        @quality_step = attributes[:qualityStep]
      end

      private

      def load_sensorial_sheet(sensorial_sheet)
        return if sensorial_sheet.nil? || sensorial_sheet[:data].nil?
        @sensorial_sheet_id = sensorial_sheet[:data][:id]
      end
    end
  end
end
