# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::StageMeasurementRequirements object
module Cropster
  module Response
    class StageMeasurementRequirements < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :created,
        :last_modified,
        :minimum_readings,
        :type

      # Relationships
      attr_accessor :stage_id

      def load_from_data(data)
        super
        load_stage(data[:relationships][:stage])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created = load_date(attributes[:created])
        @last_modified = load_date(attributes[:lastModified])
        @minimum_readings = attributes[:minimumReadings]
        @type = attributes[:type]
      end

      private

      def load_stage(stage)
        return if stage.nil? || stage[:data].nil?
        @stage_id = stage[:data][:id]
      end
    end
  end
end
