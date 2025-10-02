# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::OrderableProducts object
module Cropster
  module Response
    class OrderableProducts < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created_date,
        :external_id,
        :is_archived,
        :is_ignored,
        :is_post_roast_blend,
        :is_product_bundle,
        :is_unreviewed,
        :last_modified_date,
        :notes,
        :on_hand_inventory

      # Relationships
      attr_accessor :blend_profile_id,
        :bundle_items,
        :group_id,
        :profile_group_id

      def load_from_data(data)
        super
        load_blend_profile(data[:relationships][:blendProfile])
        load_bundle_items(data[:relationships][:bundleItems])
        load_group(data[:relationships][:group])
        load_profile_group(data[:relationships][:profileGroup])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created_date = load_date(attributes[:createdDate])
        @external_id = attributes[:externalId]
        @is_archived = attributes[:isArchived]
        @is_ignored = attributes[:isIgnored]
        @is_post_roast_blend = attributes[:isPostRoastBlend]
        @is_product_bundle = attributes[:isProductBundle]
        @is_unreviewed = attributes[:isUnreviewed]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @notes = attributes[:notes]
        
        # Deprecated weight attribute
        @on_hand_inventory = load_weight(attributes[:onHandInventory])
      end

      private

      def load_blend_profile(blend_profile)
        return if blend_profile.nil? || blend_profile[:data].nil?
        @blend_profile_id = blend_profile[:data][:id]
      end

      def load_bundle_items(bundle_items)
        return if bundle_items.nil? || bundle_items[:data].nil?
        @bundle_items = []
        bundle_items[:data].each do |item|
          @bundle_items << item[:id]
        end
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_profile_group(profile_group)
        return if profile_group.nil? || profile_group[:data].nil?
        @profile_group_id = profile_group[:data][:id]
      end
    end
  end
end
