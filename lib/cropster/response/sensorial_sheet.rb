# Converts a Hash to a Cropster::SensorialSheet

module Cropster::Response
  class SensorialSheet < Cropster::Response::FormattedResponseItem
    attr_accessor :name,
      :acronym,
      :delta_score,
      :has_roast_levels,
      :is_active,
      :is_evaluator_score_allowed,
      :is_global,
      :roast_levels_max,
      :roast_levels_min,
      :roast_levels_step,
      :score_maximum,
      :score_minimum,
      :sensorial_sheet_items
      :sensorial_sheet_items_path

    def load_from_data(data)
      super(data)
      @sensorial_sheet_items = []
      @sensorial_sheet_items_path = ''
      load_sensorial_sheet_items(data[:relationships][:sensorialSheetItems])
      load_sensorial_result_path(data[:relationships][:sensorialSheetItems])
    end

    def load_attributes(attributes)
      @name = attributes[:name]
      @acronym = attributes[:acronym]
      @delta_score = attributes[:deltaScore]
      @has_roast_levels = attributes[:hasRoastLevels]
      @is_active = attributes[:isActive]
      @is_evaluator_score_allowed = attributes[:isEvaluatorScoreAllowed]
      @is_global = attributes[:isGlobal]
      @roast_levels_max = attributes[:roastLevelsMax]
      @roast_levels_min = attributes[:roastLevelsMin]
      @roast_levels_step = attributes[:roastLevelsStep]
      @score_maximum = attributes[:scoreMaximum]
      @score_minimum = attributes[:scoreMinimum]
    end


    def load_sensorial_result_path(items)
      @sensorial_sheet_items_path = items[:links][:related]
    end

    def load_sensorial_sheet_items(items)
      return if items.nil?
      return if items[:data].nil?

      @sensorial_sheet_items = []
      items[:data].each do |item|
        @sensorial_sheet_items << item[:id]
      end
    end
  end
end
