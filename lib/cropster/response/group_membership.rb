# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::GroupMembership object
module Cropster
  module Response
    class GroupMembership < Cropster::Response::FormattedResponseItem
      # Attributes (all read-only)
      attr_accessor :created_date

      # Relationships (all read-only)
      attr_accessor :group_id,
        :user_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_user(data[:relationships][:user])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @created_date = load_date(attributes[:createdDate])
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_user(user)
        return if user.nil? || user[:data].nil?
        @user_id = user[:data][:id]
      end
    end
  end
end
