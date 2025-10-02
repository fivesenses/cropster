# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::StageRecords object
module Cropster
  module Response
    class StageRecords < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :created,
        :duration,
        :end_date,
        :last_modified,
        :stage_name,
        :stage_target_duration,
        :stage_type,
        :start_date

      # Relationships
      attr_accessor :batch_id,
        :location_id,
        :measurement_requirements,
        :measurements

      def load_from_data(data)
        super
        load_batch(data[:relationships][:batch])
        load_location(data[:relationships][:location])
        load_measurement_requirements(data[:relationships][:measurementRequirements])
        load_measurements(data[:relationships][:measurements])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created = load_date(attributes[:created])
        @duration = attributes[:duration]
        @end_date = load_date(attributes[:endDate])
        @last_modified = load_date(attributes[:lastModified])
        @stage_name = attributes[:stageName]
        @stage_target_duration = attributes[:stageTargetDuration]
        @stage_type = attributes[:stageType]
        @start_date = load_date(attributes[:startDate])
      end

      private

      def load_batch(batch)
        return if batch.nil? || batch[:data].nil?
        @batch_id = batch[:data][:id]
      end

      def load_location(location)
        return if location.nil? || location[:data].nil?
        @location_id = location[:data][:id]
      end

      def load_measurement_requirements(measurement_requirements)
        return if measurement_requirements.nil? || measurement_requirements[:data].nil?
        @measurement_requirements = []
        measurement_requirements[:data].each do |requirement|
          @measurement_requirements << requirement[:id]
        end
      end

      def load_measurements(measurements)
        return if measurements.nil? || measurements[:data].nil?
        @measurements = []
        measurements[:data].each do |measurement|
          @measurements << measurement[:id]
        end
      end
    end
  end
end
