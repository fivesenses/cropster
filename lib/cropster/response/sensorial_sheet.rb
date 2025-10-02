# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialSheet object
module Cropster
  module Response
    class SensorialSheet < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :acronym,
        :delta_score,
        :groupings,
        :has_roast_levels,
        :is_active,
        :is_evaluator_score_allowed,
        :is_global,
        :languages,
        :lock_state,
        :roast_levels_max,
        :roast_levels_min,
        :roast_levels_step,
        :score_maximum,
        :score_minimum

      # Relationships
      attr_accessor :product_type_id,
        :sensorial_sheet_items

      def load_from_data(data)
        super
        load_product_type(data[:relationships][:productType])
        load_sensorial_sheet_items(data[:relationships][:sensorialSheetItems])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @acronym = attributes[:acronym]
        @delta_score = attributes[:deltaScore]
        @groupings = attributes[:groupings]
        @has_roast_levels = attributes[:hasRoastLevels]
        @is_active = attributes[:isActive]
        @is_evaluator_score_allowed = attributes[:isEvaluatorScoreAllowed]
        @is_global = attributes[:isGlobal]
        @languages = attributes[:languages]
        @lock_state = attributes[:lockState]
        @roast_levels_max = attributes[:roastLevelsMax]
        @roast_levels_min = attributes[:roastLevelsMin]
        @roast_levels_step = attributes[:roastLevelsStep]
        @score_maximum = attributes[:scoreMaximum]
        @score_minimum = attributes[:scoreMinimum]
      end

      private

      def load_product_type(product_type)
        return if product_type.nil? || product_type[:data].nil?
        @product_type_id = product_type[:data][:id]
      end

      def load_sensorial_sheet_items(sensorial_sheet_items)
        return if sensorial_sheet_items.nil? || sensorial_sheet_items[:data].nil?
        @sensorial_sheet_items = []
        sensorial_sheet_items[:data].each do |item|
          @sensorial_sheet_items << item[:id]
        end
      end
    end
  end
end
