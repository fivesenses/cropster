# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProfileLotReference object
module Cropster
  module Response
    class ProfileLotReference < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :created_date

      # Relationships
      attr_accessor :lot_id,
        :profile_id

      def load_from_data(data)
        super
        load_lot(data[:relationships][:lot])
        load_profile(data[:relationships][:profile])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created_date = load_date(attributes[:createdDate])
      end

      private

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end

      def load_profile(profile)
        return if profile.nil? || profile[:data].nil?
        @profile_id = profile[:data][:id]
      end
    end
  end
end
