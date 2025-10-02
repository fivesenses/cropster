# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Machine object
module Cropster
  module Response
    class Machine < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :capacity,
        :created,
        :erp_id,
        :for_samples,
        :identifier,
        :last_modified,
        :last_used_date,
        :supported_measures,
        :type

      # Relationships
      attr_accessor :created_by_id,
        :group_id,
        :last_modified_by_id,
        :location_id

      def load_from_data(data)
        super
        load_created_by(data[:relationships][:createdBy])
        load_group(data[:relationships][:group])
        load_last_modified_by(data[:relationships][:lastModifiedBy])
        load_location(data[:relationships][:location])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created = load_date(attributes[:created])
        @erp_id = attributes[:erpId]
        @for_samples = attributes[:forSamples]
        @identifier = attributes[:identifier]
        @last_modified = load_date(attributes[:lastModified])
        @last_used_date = load_date(attributes[:lastUsedDate])
        @supported_measures = attributes[:supportedMeasures]
        @type = attributes[:type]
        
        # Measure attributes
        @capacity = load_weight(attributes[:capacity])
      end

      private

      def load_created_by(created_by)
        return if created_by.nil? || created_by[:data].nil?
        @created_by_id = created_by[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_last_modified_by(last_modified_by)
        return if last_modified_by.nil? || last_modified_by[:data].nil?
        @last_modified_by_id = last_modified_by[:data][:id]
      end

      def load_location(location)
        return if location.nil? || location[:data].nil?
        @location_id = location[:data][:id]
      end
    end
  end
end
