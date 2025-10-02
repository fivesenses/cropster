# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Classifications object
module Cropster
  module Response
    class Classifications < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :above_maximum_screen_size_proportion,
        :below_minimum_screen_size_proportion,
        :ceiling_screen_size,
        :default_yield_factor,
        :floor_screen_size,
        :is_active,
        :is_disabled,
        :is_estimate_enabled,
        :is_peaberry_screen_size_enabled,
        :maximum_defects_category_1,
        :maximum_defects_category_2,
        :maximum_screen_size,
        :maximum_total_defects,
        :minimum_cupping_score,
        :minimum_screen_size,
        :notes,
        :processing_methods

      # Relationships
      attr_accessor :flavors,
        :group_id,
        :varieties

      def load_from_data(data)
        super
        load_flavors(data[:relationships][:flavors])
        load_group(data[:relationships][:group])
        load_varieties(data[:relationships][:varieties])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @above_maximum_screen_size_proportion = attributes[:aboveMaximumScreenSizeProportion]
        @below_minimum_screen_size_proportion = attributes[:belowMinimumScreenSizeProportion]
        @ceiling_screen_size = attributes[:ceilingScreenSize]
        @default_yield_factor = attributes[:defaultYieldFactor]
        @floor_screen_size = attributes[:floorScreenSize]
        @is_active = attributes[:isActive]
        @is_disabled = attributes[:isDisabled]
        @is_estimate_enabled = attributes[:isEstimateEnabled]
        @is_peaberry_screen_size_enabled = attributes[:isPeaberryScreenSizeEnabled]
        @maximum_defects_category_1 = attributes[:maximumDefectsCategory1]
        @maximum_defects_category_2 = attributes[:maximumDefectsCategory2]
        @maximum_screen_size = attributes[:maximumScreenSize]
        @maximum_total_defects = attributes[:maximumTotalDefects]
        @minimum_cupping_score = attributes[:minimumCuppingScore]
        @minimum_screen_size = attributes[:minimumScreenSize]
        @notes = attributes[:notes]
        @processing_methods = attributes[:processingMethods]
      end

      private

      def load_flavors(flavors)
        return if flavors.nil? || flavors[:data].nil?
        @flavors = []
        flavors[:data].each do |flavor|
          @flavors << flavor[:id]
        end
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_varieties(varieties)
        return if varieties.nil? || varieties[:data].nil?
        @varieties = []
        varieties[:data].each do |variety|
          @varieties << variety[:id]
        end
      end
    end
  end
end
