# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Location object
module Cropster
  module Response
    class Location < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :city,
        :country,
        :is_active,
        :street,
        :time_zone,
        :zip

      # Relationships
      attr_accessor :group_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @city = attributes[:city]
        @country = attributes[:country]
        @is_active = attributes[:isActive]
        @street = attributes[:street]
        @time_zone = attributes[:timeZone]
        @zip = attributes[:zip]
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end
    end
  end
end
