# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProductionOrders object
module Cropster
  module Response
    class ProductionOrders < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :created,
        :customer,
        :customer_type,
        :external_id,
        :external_reference,
        :external_status,
        :is_archived,
        :is_status_manually_changed,
        :last_modified_date,
        :last_status_change_date,
        :order_date,
        :sales_person,
        :status

      # Relationships
      attr_accessor :created_by_id,
        :group_id,
        :production_order_items

      def load_from_data(data)
        super
        load_created_by(data[:relationships][:createdBy])
        load_group(data[:relationships][:group])
        load_production_order_items(data[:relationships][:productionOrderItems])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @created = load_date(attributes[:created])
        @customer = attributes[:customer]
        @customer_type = attributes[:customerType]
        @external_id = attributes[:externalId]
        @external_reference = attributes[:externalReference]
        @external_status = attributes[:externalStatus]
        @is_archived = attributes[:isArchived]
        @is_status_manually_changed = attributes[:isStatusManuallyChanged]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @last_status_change_date = load_date(attributes[:lastStatusChangeDate])
        @order_date = load_date(attributes[:orderDate])
        @sales_person = attributes[:salesPerson]
        @status = attributes[:status]
      end

      private

      def load_created_by(created_by)
        return if created_by.nil? || created_by[:data].nil?
        @created_by_id = created_by[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_production_order_items(production_order_items)
        return if production_order_items.nil? || production_order_items[:data].nil?
        @production_order_items = []
        production_order_items[:data].each do |item|
          @production_order_items << item[:id]
        end
      end
    end
  end
end
