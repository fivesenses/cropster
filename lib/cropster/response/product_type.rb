# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProductType object
module Cropster
  module Response
    class ProductType < Cropster::Response::FormattedResponseItem
      # Attributes (all read-only)
      # Note: The id is the name of the product type (e.g., "coffee") and must be unique
      attr_accessor :name

      def load_attributes(attributes)
        return if attributes.nil?

        # In the API, the id IS the product type name
        @name = attributes[:id]
      end
    end
  end
end
