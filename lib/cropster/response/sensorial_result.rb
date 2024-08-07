# Converts a Hash into a Cropster::SensorialResult object

module Cropster::Response
  class SensorialResult < Cropster::Response::FormattedResponseItem
    attr_accessor :calculated_score,
      :evaluation_date,
      :evaluator,
      :evaluator_score,
      :final_score,
      :is_taken_into_account,
      :notes,
      :roast_level,
      :lot_id,
      :sensorial_qc_id,
      :sensorial_result_items_data,
      :sensorial_result_items,
      :sensorial_session_id,
      :sensorial_sheet_id,
      :sensorial_sheet_item_link
      :sensorial_qc

    def load_from_data(data)
      super(data)
      @sensorial_result_items = []
      load_relationships(data[:relationships])
      load_lot(data[:relationships][:lot])
      load_sensorial_qc(data[:relationships][:sensorialQc])
      load_sensorial_session(data[:relationships][:sensorialSession])
      load_sensorial_sheet(data[:relationships][:sensorialSheet])
      load_sensorial_result_items(data[:relationships][:sensorialResultItems])

      @sensorial_qc = ''
      load_physical_sheet_data = load_physical_sheet_data(data[:relationships][:physicalSheet])
    end

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_score = attributes[:calculatedScore]
      @evaluation_date = attributes[:evaluationDate]
      @evaluator = attributes[:evaluator]
      @evaluator_score = attributes[:evaluatorScore]
      @final_score = attributes[:finalScore]
      @is_taken_into_account = attributes[:isTakenIntoAccount]
      @notes = attributes[:notes]
      @roast_level = attributes[:roastLevel]
    end

    def load_from_data(data)
      super
      @physical_sheet = ''
      load_physical_sheet_data = load_physical_sheet_data(data[:relationships][:physicalSheet])
    end

    def load_physical_sheet_data(parent)
      return if parent.nil?
      @physical_sheet = load_parent(parent[:data])
    end



    def load_sensorial_result_items(path)
      return if path.nil?
      @sensorial_sheet_item_link = path[:links][:related];
    end
  end
end
