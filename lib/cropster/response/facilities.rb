# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Facilities object
module Cropster
  module Response
    class Facilities < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :acronym,
        :is_active

      # Relationships
      attr_accessor :contact_id,
        :facility_manager_id,
        :group_id

      def load_from_data(data)
        super
        load_contact(data[:relationships][:contact])
        load_facility_manager(data[:relationships][:facilityManager])
        load_group(data[:relationships][:group])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @acronym = attributes[:acronym]
        @is_active = attributes[:isActive]
      end

      private

      def load_contact(contact)
        return if contact.nil? || contact[:data].nil?
        @contact_id = contact[:data][:id]
      end

      def load_facility_manager(facility_manager)
        return if facility_manager.nil? || facility_manager[:data].nil?
        @facility_manager_id = facility_manager[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end
    end
  end
end