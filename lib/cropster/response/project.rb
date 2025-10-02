# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Project object
module Cropster
  module Response
    class Project < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :description,
        :is_archived

      # Relationships
      attr_accessor :group_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @description = attributes[:description]
        @is_archived = attributes[:isArchived]
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end
    end
  end
end
