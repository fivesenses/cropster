# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ReceptionItems object
module Cropster
  module Response
    class ReceptionItems < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :gross_weight,
        :is_active,
        :part,
        :price,
        :price_base,
        :weight

      # Relationships
      attr_accessor :reception_id,
        :source_id,
        :source_role_id

      def load_from_data(data)
        super
        load_reception(data[:relationships][:reception])
        load_source(data[:relationships][:source])
        load_source_role(data[:relationships][:sourceRole])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @is_active = attributes[:isActive]
        @part = attributes[:part]
        
        # Weight and price attributes
        @gross_weight = load_weight(attributes[:grossWeight])
        @price = load_price(attributes[:price], nil)
        @price_base = load_weight(attributes[:priceBase])
        @weight = load_weight(attributes[:weight])
      end

      private

      def load_reception(reception)
        return if reception.nil? || reception[:data].nil?
        @reception_id = reception[:data][:id]
      end

      def load_source(source)
        return if source.nil? || source[:data].nil?
        @source_id = source[:data][:id]
      end

      def load_source_role(source_role)
        return if source_role.nil? || source_role[:data].nil?
        @source_role_id = source_role[:data][:id]
      end
    end
  end
end
  