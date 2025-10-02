# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialQc object
module Cropster
  module Response
    class SensorialQc < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :category,
        :created_date,
        :description,
        :is_active,
        :lab,
        :last_modified_date,
        :result_summary,
        :result_type,
        :sample_code,
        :schedule_date,
        :weight

      # Relationships
      attr_accessor :group_id,
        :lot_id,
        :sensorial_results,
        :sensorial_session_id,
        :sensorial_sheet_id

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_lot(data[:relationships][:lot])
        load_sensorial_results(data[:relationships][:sensorialResults])
        load_sensorial_session(data[:relationships][:sensorialSession])
        load_sensorial_sheet(data[:relationships][:sensorialSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @category = attributes[:category]
        @created_date = load_date(attributes[:createdDate])
        @description = attributes[:description]
        @is_active = attributes[:isActive]
        @lab = attributes[:lab]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @result_summary = attributes[:resultSummary]
        @result_type = attributes[:resultType]
        @sample_code = attributes[:sampleCode]
        @schedule_date = load_date(attributes[:scheduleDate])
        @weight = load_weight(attributes[:weight])
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end

      def load_sensorial_results(sensorial_results)
        return if sensorial_results.nil? || sensorial_results[:data].nil?
        @sensorial_results = []
        sensorial_results[:data].each do |result|
          @sensorial_results << result[:id]
        end
      end

      def load_sensorial_session(sensorial_session)
        return if sensorial_session.nil? || sensorial_session[:data].nil?
        @sensorial_session_id = sensorial_session[:data][:id]
      end

      def load_sensorial_sheet(sensorial_sheet)
        return if sensorial_sheet.nil? || sensorial_sheet[:data].nil?
        @sensorial_sheet_id = sensorial_sheet[:data][:id]
      end
    end
  end
end
