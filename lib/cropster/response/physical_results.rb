##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalResults < Cropster::Response::FormattedResponseItem
    attr_accessor  :id_tag, :category, :color_overall, :color_uniformity, :comment, :density, :evaluation_date, :evaluator, :lab, :peaberry_screen_sizes, :quaker_count, :screen_size_summary, :screen_sizes, :smell, :water_activity, :density_volume_amount, :density_volume_unit, :density_volume_amount_si, :density_weight_amount, :density_weight_unit, :density_weight_amount_si, :milling_weight_difference_amount, :milling_weight_difference_units, :milling_weight_difference_amount_si, :roasted_weight_amount, :roasted_weight_unit,, :moisture_unit, :moisture_amount, :parchment_weight_unit, :parchment_weight_amount, :green_weight_unit, :green_weight_amount, :temperature_unit, :temperature_amount

    def load_attributes(attributes)
      return if attributes.nil?
      @id_tag = attributes [:idTag]
      @category = attributes [:category]
      @color_overall = attributes [:colorOverall]
      @color_uniformity = attributes [:colorUniformity]
      @comment = attributes [:comment]
      @density = attributes [:density]
      @evaluation_date = attributes [:evaluationDate]
      @evaluator = attributes [:evaluator]
      @green_weight_unit = attributes[:greenWeight][:unit]
      @green_weight_amount = attributes[:greenWeight][:amount]
      @lab = attributes [:lab]
      @moisture_unit = attributes[:moisture][:unit]
      @moisture_amount = attributes[:moisture][:amount]
      @parchment_weight_unit = attributes [:parchmentWeight][:unit]
      @parchment_weight_amount = attributes [:parchmentWeight][:amount]
      @peaberry_screen_sizes = attributes [:peaberryScreenSizes]
      @quaker_count = attributes [:quakerCount]
      @roasted_weight_amount = attributes[:roastedWeight][:amount] 
      @roasted_weight_unit = attributes[:roastedWeight][:unit]  
      @screen_size_summary = attributes [:screenSizeSummary]
      @screen_sizes = attributes [:screenSizes]
      @smell = attributes [:smell]
      @temperature_unit = attributes [:temperature][:unit]
      @temperature_amount = attributes [:temperature][:amount]
      @water_activity = attributes [:waterActivity]
      @density_volume_amount = attributes[:densityVolume][:amount]
      @density_volume_unit = attributes[:densityVolume][:unit]
      density_volume_amount_si = attributes[:densityVolume][:amountSI]  
      @density_weight_amount = attributes[:densityWeight][:amount]
      @density_weight_unit = attributes[:densityWeight][:unit]
      @density_weight_amount_si = attributes[:densityWeight][:amountSI]
      @milling_weight_difference_amount = attributes[:millingWeightDifference][:amount]
      @milling_weight_difference_unit = attributes[:millingWeightDifference][:unit]
      @milling_weight_difference_amount_si = attributes[:millingWeightDifference][:amountSI]
      
    end
  end
end
  
