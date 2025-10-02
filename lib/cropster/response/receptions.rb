# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Receptions object
module Cropster
  module Response
    class Receptions < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :coffee_form,
        :is_active,
        :reception_date

      # Relationships
      attr_accessor :batches,
        :facility_id,
        :group_id,
        :reception_items

      def load_from_data(data)
        super
        load_batches(data[:relationships][:batches])
        load_facility(data[:relationships][:facility])
        load_group(data[:relationships][:group])
        load_reception_items(data[:relationships][:receptionItems])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @coffee_form = attributes[:coffeeForm]
        @is_active = attributes[:isActive]
        @reception_date = load_date(attributes[:receptionDate])
      end

      private

      def load_batches(batches)
        return if batches.nil? || batches[:data].nil?
        @batches = []
        batches[:data].each do |batch|
          @batches << batch[:id]
        end
      end

      def load_facility(facility)
        return if facility.nil? || facility[:data].nil?
        @facility_id = facility[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_reception_items(reception_items)
        return if reception_items.nil? || reception_items[:data].nil?
        @reception_items = []
        reception_items[:data].each do |reception_item|
          @reception_items << reception_item[:id]
        end
      end
    end
  end
end
