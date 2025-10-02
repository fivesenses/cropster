# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::StageRecordMeasurements object
module Cropster
  module Response
    class StageRecordMeasurements < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :created,
        :date,
        :last_modified,
        :type,
        :value

      # Relationships
      attr_accessor :stage_record_id

      def load_from_data(data)
        super
        load_stage_record(data[:relationships][:stageRecord])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created = load_date(attributes[:created])
        @date = load_date(attributes[:date])
        @last_modified = load_date(attributes[:lastModified])
        @type = attributes[:type]
        @value = load_weight(attributes[:value])
      end

      private

      def load_stage_record(stage_record)
        return if stage_record.nil? || stage_record[:data].nil?
        @stage_record_id = stage_record[:data][:id]
      end
    end
  end
end
