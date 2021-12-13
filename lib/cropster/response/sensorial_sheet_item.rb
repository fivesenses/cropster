# converts a Hash into a Cropster::SensorialSheetItem object

module Cropster::Response
  class SensorialSheetItem < Cropster::Response::FormattedResponseItem
    attr_accessor :name,
      :allowed_flavors,
      :formula,
      :grouping,
      :has_descriptors,
      :has_intensity,
      :has_quality,
      :input_type,
      :intensity_max,
      :intensity_min,
      :intensity_step,
      :is_general_descriptors_item,
      :note,
      :position,
      :quality_max,
      :quality_min,
      :quality_step,
      :sensorial_sheet_id

    def load_from_data(data)
      super
      load_sensorial_sheet(data[:relationships][:sensorialSheet])
    end

    def load_attributes(attributes)
      @name = attributes[:name]
      @allowed_flavors = attributes[:allowedFlavors]
      @formula = attributes[:formula]
      @grouping = attributes[:grouping]
      @has_descriptors = attributes[:hasDescriptors]
      @has_intensity = attributes[:hasIntensity]
      @has_quality = attributes[:hasQuality]
      @input_type = attributes[:inputType]
      @intensity_max = attributes[:intensityMax]
      @intensity_min = attributes[:intensityMin]
      @intensity_step = attributes[:intensityStep]
      @is_general_descriptors_item = attributes[:isGeneralDescriptorsItem]
      @note = attributes[:note]
      @position = attributes[:position]
      @quality_max = attributes[:qualityMax]
      @quality_min = attributes[:qualityMin]
      @quality_step = attributes[:qualityStep]
    end

    def load_sensorial_sheet(data)
      return if data.nil?
      return if data[:data].nil?

      @sensorial_sheet_id = data[:data][:id]
    end
  end
end
