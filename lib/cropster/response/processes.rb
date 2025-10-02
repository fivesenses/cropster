# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Processes object
module Cropster
  module Response
    class Processes < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created,
        :final_form,
        :final_weight,
        :intermediate_form,
        :intermediate_weight_source,
        :intermediate_weight_target,
        :is_active,
        :last_modified,
        :processing_method,
        :received_form,
        :received_weight

      # Relationships
      attr_accessor :group_id,
        :stages

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_stages(data[:relationships][:stages])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created = load_date(attributes[:created])
        @final_form = attributes[:finalForm]
        @intermediate_form = attributes[:intermediateForm]
        @is_active = attributes[:isActive]
        @last_modified = load_date(attributes[:lastModified])
        @processing_method = attributes[:processingMethod]
        @received_form = attributes[:receivedForm]
        
        # Weight attributes
        @intermediate_weight_source = load_weight(attributes[:intermediateWeightSource])
        @final_weight = load_weight(attributes[:finalWeight])
        @intermediate_weight_target = load_weight(attributes[:intermediateWeightTarget])
        @received_weight = load_weight(attributes[:receivedWeight])
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_stages(stages)
        return if stages.nil? || stages[:data].nil?
        @stages = []
        stages[:data].each do |stage|
          @stages << stage[:id]
        end
      end
    end
  end
end