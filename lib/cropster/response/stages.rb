# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Stages object
module Cropster
  module Response
    class Stages < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created,
        :last_modified,
        :sort,
        :target_duration,
        :type

      # Relationships
      attr_accessor :measurement_requirements,
        :process_id

      def load_from_data(data)
        super
        load_measurement_requirements(data[:relationships][:measurementRequirements])
        load_process(data[:relationships][:process])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created = load_date(attributes[:created])
        @last_modified = load_date(attributes[:lastModified])
        @sort = attributes[:sort]
        @target_duration = attributes[:targetDuration]
        @type = attributes[:type]
      end

      private

      def load_measurement_requirements(measurement_requirements)
        return if measurement_requirements.nil? || measurement_requirements[:data].nil?
        @measurement_requirements = []
        measurement_requirements[:data].each do |requirement|
          @measurement_requirements << requirement[:id]
        end
      end

      def load_process(process)
        return if process.nil? || process[:data].nil?
        @process_id = process[:data][:id]
      end
    end
  end
end
