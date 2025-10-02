# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ContactRole object
module Cropster
  module Response
    class ContactRole < Cropster::Response::FormattedResponseItem
      # Attributes (all read-only)
      attr_accessor :name

      # Note: This object has no relationships per the API documentation

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
      end
    end
  end
end

