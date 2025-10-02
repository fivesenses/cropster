# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::PhysicalSheets object
module Cropster
  module Response
    class PhysicalSheets < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :is_density_calculated,
        :is_global,
        :is_parchment_coffee,
        :is_peaberry_screen_size_enabled,
        :languages,
        :lock_state,
        :screen_size_mode

      # Relationships
      attr_accessor :physical_sheet_defects

      def load_from_data(data)
        super
        load_physical_sheet_defects(data[:relationships][:physicalSheetDefects])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @is_density_calculated = attributes[:isDensityCalculated]
        @is_global = attributes[:isGlobal]
        @is_parchment_coffee = attributes[:isParchmentCoffee]
        @is_peaberry_screen_size_enabled = attributes[:isPeaberryScreenSizeEnabled]
        @languages = attributes[:languages]
        @lock_state = attributes[:lockState]
        @screen_size_mode = attributes[:screenSizeMode]
      end

      private

      def load_physical_sheet_defects(physical_sheet_defects)
        return if physical_sheet_defects.nil? || physical_sheet_defects[:data].nil?
        @physical_sheet_defects = []
        physical_sheet_defects[:data].each do |defect|
          @physical_sheet_defects << defect[:id]
        end
      end
    end
  end
end
