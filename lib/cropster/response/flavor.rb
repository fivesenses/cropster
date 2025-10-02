# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Flavor object
module Cropster
  module Response
    class Flavor < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :is_dirty,
        :is_positive

      # Relationships
      attr_accessor :group_id,
        :product_type_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_product_type(data[:relationships][:productType])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @is_dirty = attributes[:isDirty]
        @is_positive = attributes[:isPositive]
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_product_type(product_type)
        return if product_type.nil? || product_type[:data].nil?
        @product_type_id = product_type[:data][:id]
      end
    end
  end
end
