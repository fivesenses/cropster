# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProfileComponent object
module Cropster
  module Response
    class ProfileComponent < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :percentage

      # Relationships
      attr_accessor :lots,
        :profile_id

      def load_from_data(data)
        super
        load_lots(data[:relationships][:lots])
        load_profile(data[:relationships][:profile])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @percentage = attributes[:percentage]
      end

      private

      def load_lots(lots)
        return if lots.nil? || lots[:data].nil?
        @lots = []
        lots[:data].each do |lot|
          @lots << lot[:id]
        end
      end

      def load_profile(profile)
        return if profile.nil? || profile[:data].nil?
        @profile_id = profile[:data][:id]
      end
    end
  end
end
