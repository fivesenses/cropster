#
# Converts a Hash into a Cropster::Response::SensorialQc object
#
module Cropster::Response
  class SensorialQc < Cropster::Response::FormattedResponseItem
    attr_accessor :id,
      :type,
      :created_at,
      :last_modified_at,
      :sample_code,
      :schedule_date,
      :id_tag,
      :description,
      :weight,
      :result_average_score,
      :result_samples_count,
      :result_spread_min,
      :result_spread_max,
      :is_active,
      :category,
      :lab,
      :result_type,
      :lot_id,
      :sensorial_session_id,
      :sensorial_sheet_id,
      :sensorial_results

    def load_from_data(data)
      super
      @sensorial_results = []
      load_lot(data[:relationships][:lot])
      load_sensorial_session(data[:relationships][:sensorialSession])
      load_sensorial_sheet(data[:relationships][:sensorialSheet])
      load_sensorial_results(data[:relationships][:sensorialResults])
    end

    # @param [:Hash] attributes
    def load_attributes(attributes)
      return if attributes.nil?

      @created_at = load_date(attributes[:createdDate])
      @last_modified_at = load_date(attributes[:lastModifiedDate])
      @sample_code = attributes[:sampleCode]
      @schedule_date = load_date(attributes[:scheduleDate])
      @id_tag = attributes[:idTag]
      @description = attributes[:description]
      @is_active = attributes[:isActive]
      @category = attributes[:category]
      @lab = attributes[:lab]
      @weight = load_weight(attributes[:weight])
      @result_average_score = attributes[:resultSummary][:averageScore]&.to_f
      @result_samples_count = attributes[:resultSummary][:samplesCount]&.to_i
      @result_spread_min = attributes[:resultSummary][:minSpread]
      @result_spread_max = attributes[:resultSummary][:maxSpread]
      @result_type = attributes[:resultType]
    end

    def load_sensorial_results(items)
      return if items.nil?
      return if items[:data].nil?

      @sensorial_results = []
      items[:data].each do |item|
        @sensorial_results << item[:id]
      end
    end
  end
end
