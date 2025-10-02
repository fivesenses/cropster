# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::BatchMixes object
module Cropster
  module Response
    class BatchMixes < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :is_active,
        :is_committed

      # Relationships
      attr_accessor :batches,
        :created_by_id,
        :group_id,
        :last_modified_by_id,
        :lot_id

      def load_from_data(data)
        super
        load_batches(data[:relationships][:batches])
        load_created_by(data[:relationships][:createdBy])
        load_group(data[:relationships][:group])
        load_last_modified_by(data[:relationships][:lastModifiedBy])
        load_lot(data[:relationships][:lot])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @is_active = attributes[:isActive]
        @is_committed = attributes[:isCommitted]
      end

      private

      def load_batches(batches)
        return if batches.nil? || batches[:data].nil?
        @batches = []
        batches[:data].each do |batch|
          @batches << batch[:id]
        end
      end

      def load_created_by(created_by)
        return if created_by.nil? || created_by[:data].nil?
        @created_by_id = created_by[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_last_modified_by(last_modified_by)
        return if last_modified_by.nil? || last_modified_by[:data].nil?
        @last_modified_by_id = last_modified_by[:data][:id]
      end

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end
    end
  end
end