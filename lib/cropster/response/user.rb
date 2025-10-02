# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::User object
module Cropster
  module Response
    class User < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :active,
        :created_date,
        :email,
        :last_modified_date,
        :locale,
        :role,
        :timezone,
        :username

      # Relationships
      attr_accessor :group_memberships

      def load_from_data(data)
        super
        load_group_memberships(data[:relationships][:groupMemberships])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @active = attributes[:active]
        @created_date = load_date(attributes[:createdDate])
        @email = attributes[:email]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @locale = attributes[:locale]
        @role = attributes[:role]
        @timezone = attributes[:timezone]
        @username = attributes[:username]
      end

      private

      def load_group_memberships(group_memberships)
        return if group_memberships.nil? || group_memberships[:data].nil?
        @group_memberships = []
        group_memberships[:data].each do |membership|
          @group_memberships << membership[:id]
        end
      end
    end
  end
end
