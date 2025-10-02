# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialSession object
module Cropster
  module Response
    class SensorialSession < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :name,
        :code_type,
        :codes,
        :evaluators,
        :is_active,
        :is_blind,
        :lab,
        :schedule_date,
        :sensorial_qc_count,
        :sensorial_qc_order,
        :state

      # Relationships
      attr_accessor :group_id,
        :sensorial_qcs,
        :sensorial_sheet_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_sensorial_qcs(data[:relationships][:sensorialQcs])
        load_sensorial_sheet(data[:relationships][:sensorialSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @name = attributes[:name]
        @code_type = attributes[:codeType]
        @codes = attributes[:codes]
        @evaluators = attributes[:evaluators]
        @is_active = attributes[:isActive]
        @is_blind = attributes[:isBlind]
        @lab = attributes[:lab]
        @schedule_date = load_date(attributes[:scheduleDate])
        @sensorial_qc_count = attributes[:sensorialQcCount]
        @sensorial_qc_order = attributes[:sensorialQcOrder]
        @state = attributes[:state]
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_sensorial_qcs(sensorial_qcs)
        return if sensorial_qcs.nil? || sensorial_qcs[:data].nil?
        @sensorial_qcs = []
        sensorial_qcs[:data].each do |qc|
          @sensorial_qcs << qc[:id]
        end
      end

      def load_sensorial_sheet(sensorial_sheet)
        return if sensorial_sheet.nil? || sensorial_sheet[:data].nil?
        @sensorial_sheet_id = sensorial_sheet[:data][:id]
      end
    end
  end
end
