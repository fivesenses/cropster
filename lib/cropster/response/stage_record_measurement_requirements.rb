# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::StageRecordMeasurementRequirements object
module Cropster
  module Response
    class StageRecordMeasurementRequirements < Cropster::Response::FormattedResponseItem
      # Attributes (all read-only)
      attr_accessor :created,
        :minimum_readings,
        :type

      # Relationships
      attr_accessor :stage_record_id

      def load_from_data(data)
        super
        load_stage_record(data[:relationships][:stageRecord])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created = load_date(attributes[:created])
        @minimum_readings = attributes[:minimumReadings]
        @type = attributes[:type]
      end

      private

      def load_stage_record(stage_record)
        return if stage_record.nil? || stage_record[:data].nil?
        @stage_record_id = stage_record[:data][:id]
      end
    end
  end
end
