# converts a Hash into a Cropster::SensorialResultItem object

module Cropster::Response
  class SensorialResultItem < Cropster::Response::FormattedResponseItem
    attr_accessor :sensorial_result_id, :sensorial_sheet_item_id,
      :calculated_quality, :intensity, :quality

    def load_from_data(data)
      super(data)
      load_sensorial_result(data[:relationships][:sensorialResult])
      load_sensorial_sheet_item(data[:relationships][:sensorialSheetItem])
    end

    def load_attributes(attributes)
      return if attributes.nil?

      @sensorial_result_id = attributes[:sensorialResultId]
      @sensorial_sheet_id = attributes[:sensorialSheetId]
      @calculated_quality = attributes[:calculatedQuality]
      @intensity = attributes[:intensity]
      @quality = attributes[:quality]
    end

    def load_sensorial_result(sensorial_result)
      return if sensorial_result.nil?
      return if sensorial_result[:data].nil?

      @sensorial_result_id = sensorial_result[:data][:id]
    end

    def load_sensorial_sheet_item(sensorial_sheet_item)
      return if sensorial_sheet_item.nil?
      return if sensorial_sheet_item[:data].nil?

      @sensorial_sheet_item_id = sensorial_sheet_item[:data][:id]
    end
  end
end
