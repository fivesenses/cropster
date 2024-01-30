##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalSheets < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :is_density_calculated, :is_global, :is_parchment_coffee, :is_peaberry_screen_size_enabled, :languages, :lock_state, :screen_size_mode, :defects_path

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @is_density_calculated = attributes[:isDensityCalculated]
      @is_global = attributes[:isGlobal]
      @is_parchment_coffee = attributes[:isParchmentCoffee]
      @is_peaberry_screen_size_enabled = attributes[:isPeaberryScreenSizeEnabled]
      @languages = attributes[:languages]
      @lock_state = attributes[:lockState]
      @screen_size_mode = attributes[:screenSizeMode]
    end

    def load_from_data(data)
      super
      @defects_path = ""
      load_path(data[:relationships][:physicalSheetDefects])

    end

    def load_path(item)
      return if item.nil?
      @defects_path = item[:links][:related]
    end

  end
end
  
