# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::BlendProfiles object
module Cropster
  module Response
    class BlendProfiles < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created_date,
        :is_active,
        :is_archived,
        :last_modified_date

      # Relationships
      attr_accessor :blend_profile_components,
        :group_id

      def load_from_data(data)
        super
        load_blend_profile_components(data[:relationships][:blendProfileComponents])
        load_group(data[:relationships][:group])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created_date = load_date(attributes[:createdDate])
        @is_active = attributes[:isActive]
        @is_archived = attributes[:isArchived]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
      end

      private

      def load_blend_profile_components(blend_profile_components)
        return if blend_profile_components.nil? || blend_profile_components[:data].nil?
        @blend_profile_components = []
        blend_profile_components[:data].each do |component|
          @blend_profile_components << component[:id]
        end
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end
    end
  end
end
