# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialDescriptor object
module Cropster
  module Response
    class SensorialDescriptor < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :intensity,
        :is_positive

      # Relationships
      attr_accessor :flavor_id,
        :sensorial_result_item_id

      def load_from_data(data)
        super
        load_flavor(data[:relationships][:flavor])
        load_sensorial_result_item(data[:relationships][:sensorialResultItem])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @intensity = attributes[:intensity]
        @is_positive = attributes[:isPositive]
      end

      private

      def load_flavor(flavor)
        return if flavor.nil? || flavor[:data].nil?
        @flavor_id = flavor[:data][:id]
      end

      def load_sensorial_result_item(sensorial_result_item)
        return if sensorial_result_item.nil? || sensorial_result_item[:data].nil?
        @sensorial_result_item_id = sensorial_result_item[:data][:id]
      end
    end
  end
end
