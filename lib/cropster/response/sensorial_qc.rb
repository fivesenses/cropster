#
# Converts a Hash into a Cropster::Response::SensorialQc object
#
module Cropster::Response
  class SensorialQc < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :type, :created_at, :last_modified_at, :sample_code,
      :schedule_date, :description, :weight, :result_average_score, :result_samples_count,
      :result_spread_min, :result_spread_max, :active, :category, :lab, :result_type,
      :lot_id

    def load_from_data(data)
      super
      load_lot(data[:relationships][:lot])
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
    end

    def load_lot(lot)
      return if lot.nil?

      @lot_id = lot[:data][:id]
    end
  end
end
