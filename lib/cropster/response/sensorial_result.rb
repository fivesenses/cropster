# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::SensorialResult object
module Cropster
  module Response
    class SensorialResult < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :calculated_score,
        :evaluation_date,
        :evaluator,
        :evaluator_score,
        :final_score,
        :is_taken_into_account,
        :notes,
        :roast_level

      # Relationships
      attr_accessor :lot_id,
        :sensorial_qc_id,
        :sensorial_result_items,
        :sensorial_session_id,
        :sensorial_sheet_id

      def load_from_data(data)
        super
        load_lot(data[:relationships][:lot])
        load_sensorial_qc(data[:relationships][:sensorialQc])
        load_sensorial_result_items(data[:relationships][:sensorialResultItems])
        load_sensorial_session(data[:relationships][:sensorialSession])
        load_sensorial_sheet(data[:relationships][:sensorialSheet])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @calculated_score = attributes[:calculatedScore]
        @evaluation_date = load_date(attributes[:evaluationDate])
        @evaluator = attributes[:evaluator]
        @evaluator_score = attributes[:evaluatorScore]
        @final_score = attributes[:finalScore]
        @is_taken_into_account = attributes[:isTakenIntoAccount]
        @notes = attributes[:notes]
        @roast_level = attributes[:roastLevel]
      end

      private

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end

      def load_sensorial_qc(sensorial_qc)
        return if sensorial_qc.nil? || sensorial_qc[:data].nil?
        @sensorial_qc_id = sensorial_qc[:data][:id]
      end

      def load_sensorial_result_items(sensorial_result_items)
        return if sensorial_result_items.nil? || sensorial_result_items[:data].nil?
        @sensorial_result_items = []
        sensorial_result_items[:data].each do |item|
          @sensorial_result_items << item[:id]
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
