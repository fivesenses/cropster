# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::PhysicalResults object
module Cropster
  module Response
    class PhysicalResults < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :category,
        :color_overall,
        :color_uniformity,
        :comment,
        :density,
        :density_volume,
        :density_weight,
        :evaluation_date,
        :evaluator,
        :green_weight,
        :lab,
        :milling_weight_difference,
        :moisture,
        :parchment_weight,
        :peaberry_screen_sizes,
        :quaker_count,
        :roasted_weight,
        :screen_size_summary,
        :screen_sizes,
        :smell,
        :temperature,
        :water_activity

      # Relationships
      attr_accessor :group_id,
        :lot_id,
        :physical_result_defects,
        :physical_sheet_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_lot(data[:relationships][:lot])
        load_physical_result_defects(data[:relationships][:physicalResultDefects])
        load_physical_sheet(data[:relationships][:physicalSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @category = attributes[:category]
        @color_overall = attributes[:colorOverall]
        @color_uniformity = attributes[:colorUniformity]
        @comment = attributes[:comment]
        @density = attributes[:density]
        @evaluation_date = load_date(attributes[:evaluationDate])
        @evaluator = attributes[:evaluator]
        @lab = attributes[:lab]
        @peaberry_screen_sizes = attributes[:peaberryScreenSizes]
        @quaker_count = attributes[:quakerCount]
        @screen_size_summary = attributes[:screenSizeSummary]
        @screen_sizes = attributes[:screenSizes]
        @smell = attributes[:smell]
        @water_activity = attributes[:waterActivity]

        # Weight/measure attributes
        @density_volume = load_weight(attributes[:densityVolume])
        @density_weight = load_weight(attributes[:densityWeight])
        @green_weight = load_weight(attributes[:greenWeight])
        @milling_weight_difference = load_weight(attributes[:millingWeightDifference])
        @moisture = load_weight(attributes[:moisture])
        @parchment_weight = load_weight(attributes[:parchmentWeight])
        @roasted_weight = load_weight(attributes[:roastedWeight])
        @temperature = load_weight(attributes[:temperature])
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end

      def load_physical_result_defects(physical_result_defects)
        return if physical_result_defects.nil? || physical_result_defects[:data].nil?
        @physical_result_defects = []
        physical_result_defects[:data].each do |defect|
          @physical_result_defects << defect[:id]
        end
      end

      def load_physical_sheet(physical_sheet)
        return if physical_sheet.nil? || physical_sheet[:data].nil?
        @physical_sheet_id = physical_sheet[:data][:id]
      end
    end
  end
end
