##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Classifications < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :name,
    :above_maximum_screen_size_proportion,
    :below_minimum_screen_size_proportion,
    :ceiling_screen_size,
    :default_yield_sactor,
    :floor_screen_size,
    :is_active,
    :is_disabled,
    :is_estimate_enabled,
    :is_peaberry_screen_size_enabled,
    :maximum_defects_category_1,
    :maximum_defects_category_2,
    :maximum_screen_size,
    :maximum_total_defects,
    :minimum_cupping_score,
    :minimum_screen_size,
    :notes,
    :processing_methods,

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @above_maximum_screen_size_proportion = attributes[:aboveMaximumScreenSizeProportion ]
      @below_minimum_screen_size_proportion = attributes[:belowMinimumScreenSizeProportion]
      @ceiling_screen_size = attributes[:ceilingScreenSize]
      @default_yield_sactor = attributes[:defaultYieldFactor]
      @floor_screen_size = attributes[:floorScreenSize]
      @is_active = attributes[:isActive]
      @is_disabled = attributes[:isDisabled]
      @is_estimate_enabled = attributes[:isEstimateEnabled]
      @is_peaberry_screen_size_enabled = attributes[:isPeaberryScreenSizeEnabled]
      @maximum_defects_category_1 = attributes[:maximumDefectsCategory1]
      @maximum_defects_category_2 = attributes[:maximumDefectsCategory2]
      @maximum_screen_size = attributes[:maximumScreenSize]
      @maximum_total_defects = attributes[:maximumTotalDefects]
      @minimum_cupping_score = attributes[:minimumCuppingScore]
      @minimum_screen_size = attributes[:minimumScreenSize]
      @notes = attributes[:notes]
      @processing_methods = attributes[:processingMethods]

    end
  end
end

