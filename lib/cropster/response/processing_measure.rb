# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProcessingMeasure object
module Cropster
  module Response
    class ProcessingMeasure < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :measure

      # Relationships
      attr_accessor :processing_id

      def load_from_data(data)
        super
        load_processing(data[:relationships][:processing])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @measure = load_weight(attributes[:measure])
      end

      private

      def load_processing(processing)
        return if processing.nil? || processing[:data].nil?
        @processing_id = processing[:data][:id]
      end
    end
  end
end
