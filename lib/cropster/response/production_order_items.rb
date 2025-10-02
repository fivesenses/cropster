# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::ProductionOrderItems object
module Cropster
  module Response
    class ProductionOrderItems < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :format,
        :quantity,
        :sku,
        :variant_info

      # Relationships
      attr_accessor :orderable_product_id,
        :production_order_id

      def load_from_data(data)
        super
        load_orderable_product(data[:relationships][:orderableProduct])
        load_production_order(data[:relationships][:productionOrder])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @format = attributes[:format]
        @sku = attributes[:sku]
        @variant_info = attributes[:variantInfo]
        
        # Measure attribute
        @quantity = load_weight(attributes[:quantity])
      end

      private

      def load_orderable_product(orderable_product)
        return if orderable_product.nil? || orderable_product[:data].nil?
        @orderable_product_id = orderable_product[:data][:id]
      end

      def load_production_order(production_order)
        return if production_order.nil? || production_order[:data].nil?
        @production_order_id = production_order[:data][:id]
      end
    end
  end
end
