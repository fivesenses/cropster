# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::BlendProfileComponents object
module Cropster
  module Response
    class BlendProfileComponents < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :percentage

      # Relationships
      attr_accessor :blend_profile_id,
        :profile_group_id

      def load_from_data(data)
        super
        load_blend_profile(data[:relationships][:blendProfile])
        load_profile_group(data[:relationships][:profileGroup])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @percentage = attributes[:percentage]
      end

      private

      def load_blend_profile(blend_profile)
        return if blend_profile.nil? || blend_profile[:data].nil?
        @blend_profile_id = blend_profile[:data][:id]
      end

      def load_profile_group(profile_group)
        return if profile_group.nil? || profile_group[:data].nil?
        @profile_group_id = profile_group[:data][:id]
      end
    end
  end
end
