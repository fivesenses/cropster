# Converts a Hash to a Cropster::SensorialSheet

module Cropster::Response
  class SensorialSheet < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :acronym, :delta_score, :has_roast_levels, :is_active,
      :is_evaluator_score_allowed, :is_global, :roast_levels_max, :roast_levels_min,
      :roast_levels_step, :score_maximum, :score_minimum

    def load_attributes(attributes)
      @name = attributes["name"]
      @acronym = attributes["acronym"]
      @delta_score = attributes["deltaScore"]
      @has_roast_levels = attributes["hasRoastLevels"]
      @is_active = attributes["isActive"]
      @is_evaluator_score_allowed = attributes["isEvaluatorScoreAllowed"]
      @is_global = attributes["isGlobal"]
      @roast_levels_max = attributes["roastLevelsMax"]
      @roast_levels_min = attributes["roastLevelsMin"]
      @roast_levels_step = attributes["roastLevelsStep"]
      @score_maximum = attributes["scoreMaximum"]
      @score_minimum = attributes["scoreMinimum"]
    end
  end
end
