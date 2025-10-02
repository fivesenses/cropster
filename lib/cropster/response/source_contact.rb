# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SourceContact object
module Cropster
  module Response
    class SourceContact < Cropster::Response::FormattedResponseItem
      # Note: This endpoint has no attributes, only relationships
      
      # Relationships
      attr_accessor :contact_id,
        :contact_role_id,
        :lot_id

      def load_from_data(data)
        super
        load_contact(data[:relationships][:contact])
        load_contact_role(data[:relationships][:contactRole])
        load_lot(data[:relationships][:lot])
      end

      def load_attributes(attributes)
        # No attributes for this endpoint
        return if attributes.nil?
      end

      private

      def load_contact(contact)
        return if contact.nil? || contact[:data].nil?
        @contact_id = contact[:data][:id]
      end

      def load_contact_role(contact_role)
        return if contact_role.nil? || contact_role[:data].nil?
        @contact_role_id = contact_role[:data][:id]
      end

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end
    end
  end
end
