##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class OrderableProducts < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :created_date, :external_id, :is_archived, :is_ignored, :is_post_roast_blend, :is_product_bundle, :is_unreviewed, :last_modified_date, :notes, :on_hand_inventory_amount, :on_hand_inventory_unit

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_value = attributes[:calculatedValue]
      @count = attributes[:count]
      @weight_amount = attributes[:weight][:amount]
      @weight_unit = attributes[:weight][:unit]
      @name = attributes[:name]
      @created_date = attributes[:createdDate]
      @external_id = attributes[:externalId]
      @is_archived = attributes[:isArchived]
      @is_ignored = attributes[:isIgnored]
      @is_post_roast_blend = attributes[:isPostRoastBlend]
      @is_product_bundle = attributes[:isProductBundle]
      @is_unreviewed = attributes[:isUnreviewed]
      @last_modified_date = attributes[:lastModifiedDate]
      @notes = attributes[:notes]
      @on_hand_inventory_amount[:onHandInventory][:amount]
      @on_hand_inventory_unit[:onHandInventory][:unit]

    end
  end
end

