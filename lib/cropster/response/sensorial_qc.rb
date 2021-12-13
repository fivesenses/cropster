#
# Converts a Hash into a Cropster::Response::SensorialQc object
#
module Cropster::Response
  class SensorialQc < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :type, :created_at, :last_modified_at, :sample_code,
      :schedule_date, :description, :weight, :result_average_score, :result_samples_count,
      :result_spread_min, :result_spread_max, :active, :category, :lab, :result_type,
      :lot_id, :sensorial_session_id, :sensorial_sheet_id, :sensorial_results

    def load_from_data(data)
      super
      load_lot(data[:relationships][:lot])
      load_sensorial_session(data[:relationships][:sensorial_session])
      load_sensorial_sheet(data[:relationships][:sensorial_sheet])
      load_sensorial_results(data[:relationships][:sensorial_results])
    end

    # @param [:Hash] attributes
    def load_attributes(attributes)
      return if attributes.nil?

      @created_at = load_date(attributes[:createdDate])
      @last_modified_at = load_date(attributes[:lastModifiedDate])
      @sample_code = attributes[:sampleCode]
      @schedule_date = load_date(attributes[:scheduleDate])
      @description = attributes[:description]
      @active = attributes[:active]
      @category = attributes[:category]
      @lab = attributes[:lab]
      @weight = load_weight(attributes[:weight])
      @result_average_score = attributes[:resultSummary][:averageScore]&.to_f
      @result_samples_count = attributes[:resultSummary][:samplesCount]&.to_i
      @result_spread_min = attributes[:resultSummary][:minSpread]
      @result_spread_max = attributes[:resultSummary][:maxSpread]
      @result_type = attributes[:resultType]
    end
  end
end
