# Converts a Hash into a Cropster::SensorialResult object

module Cropster::Response
  class SensorialResult < Cropster::Response::FormattedResponseItem
    attr_accessor :calculated_score, :evaluation_date, :evaluator, :evaluator_score,
      :final_score, :is_taken_into_account, :notes, :roast_level

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_score = attributes["calculatedScore"]
      @evaluation_date = attributes["evaluationDate"]
      @evaluator = attributes["evaluator"]
      @evaluator_score = attributes["evaluatorScore"]
      @final_score = attributes["finalScore"]
      @is_taken_into_account = attributes["isTakenIntoAccount"]
      @notes = attributes["notes"]
      @roast_level = attributes["roastLevel"]
    end
  end
end
