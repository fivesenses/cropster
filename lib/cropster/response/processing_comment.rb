# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProcessingComment object
module Cropster
  module Response
    class ProcessingComment < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :created_date,
        :event,
        :note,
        :time

      # Relationships
      attr_accessor :processing_id

      def load_from_data(data)
        super
        load_processing(data[:relationships][:processing])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created_date = load_date(attributes[:createdDate])
        @event = attributes[:event]
        @note = attributes[:note]
        @time = attributes[:time]
      end

      private

      def load_processing(processing)
        return if processing.nil? || processing[:data].nil?
        @processing_id = processing[:data][:id]
      end
    end
  end
end
