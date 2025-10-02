# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::AdjustWeightActions object
module Cropster
  module Response
    class AdjustWeightActions < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :comment,
        :current_weight,
        :is_reset_initial_weight,
        :new_weight

      # Relationships
      attr_accessor :lot_id

      def load_from_data(data)
        super
        load_lot(data[:relationships][:lot])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @comment = attributes[:comment]
        @is_reset_initial_weight = attributes[:isResetInitialWeight]
        
        # Weight attributes
        @current_weight = load_weight(attributes[:currentWeight])
        @new_weight = load_weight(attributes[:newWeight])
      end

      private

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end
    end
  end
end
