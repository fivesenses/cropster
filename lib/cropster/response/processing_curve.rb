# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProcessingCurve object
module Cropster
  module Response
    class ProcessingCurve < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :duration,
        :is_artificial,
        :unit,
        :values

      # Relationships
      attr_accessor :processing_id

      def initialize(data)
        @values = []
        super(data)
      end

      def load_from_data(data)
        super
        load_processing(data[:relationships][:processing])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @duration = attributes[:duration]
        @is_artificial = attributes[:isArtificial]
        @unit = attributes[:unit]
        @values = attributes[:values] || []
      end

      private

      def load_processing(processing)
        return if processing.nil? || processing[:data].nil?
        @processing_id = processing[:data][:id]
      end
    end
  end
end
