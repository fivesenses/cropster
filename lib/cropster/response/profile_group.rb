# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProfileGroup object
module Cropster
  module Response
    class ProfileGroup < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created_date,
        :is_archived,
        :last_modified_date,
        :notes

      # Relationships
      attr_accessor :default_profile_id,
        :group_id,
        :profiles

      def load_from_data(data)
        super
        load_default_profile(data[:relationships][:defaultProfile])
        load_group(data[:relationships][:group])
        load_profiles(data[:relationships][:profiles])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created_date = load_date(attributes[:createdDate])
        @is_archived = attributes[:isArchived]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @notes = attributes[:notes]
      end

      private

      def load_default_profile(default_profile)
        return if default_profile.nil? || default_profile[:data].nil?
        @default_profile_id = default_profile[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_profiles(profiles)
        return if profiles.nil? || profiles[:data].nil?
        @profiles = []
        profiles[:data].each do |profile|
          @profiles << profile[:id]
        end
      end
    end
  end
end
