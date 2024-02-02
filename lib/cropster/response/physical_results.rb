##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class PhysicalResults < Cropster::Response::FormattedResponseItem
    attr_accessor :remote_id, :id_tag,:category,:color_overall,:color_uniformity,:comment,:density,:evaluation_date,:evaluator,:lab,:peaberry_screen_sizes,:quaker_count,:screen_size_summary,:screen_sizes,:smell,:water_activity, :green_weight, :moisture, :parchment, :roasted_weight, :temperature, :density_volume, 
    :density_weight, 
    :milling_weight_difference, 
    :defects_path,
    :lot,
    :physical_sheet,


    def load_from_data(data)
      super(data)
      @defects_path = "";
      @physical_sheet = "";
      @lot = "";

      load_path(data[:relationships][:physicalResultDefects])
      load_physical_sheet_data(data[:relationships][:physicalSheet])
      load_lot_data(data[:relationships][:lot])
    end

    def load_physical_sheet_data(parent)
      return if parent.nil?
      @physical_sheet = load_parent(parent[:data])
    end

    def load_lot_data(parent)
      return if parent.nil?
      @lot = load_parent(parent[:data])
    end

    def load_path(item)
      return if item.nil?
      @defects_path = item[:links][:related]
    end


    def load_attributes(attributes)
      return if attributes.nil?
      @id_tag = attributes[:idTag]
      @remote_id = attributes[:id]
      @category = attributes [:category]
      @color_overall = attributes [:colorOverall]
      @color_uniformity = attributes [:colorUniformity]
      @comment = attributes [:comment]
      @density = attributes [:density]
      @evaluation_date = attributes[:evaluationDate]
      @evaluator = attributes [:evaluator]
      @green_weight = load_weight(attributes[:greenWeight])
      @moisture = load_weight(attributes[:moisture])
      @parchment = load_weight(attributes[:parchment])
      @roasted_weight = load_weight(attributes[:roastedWeight])
      @temperature = load_weight(attributes[:temperature])
      @density_volume = load_weight(attributes[:densityVolume])
      @density_weight = load_weight(attributes[:densityWeight])
      @milling_weight_difference = load_weight(attributes[:millingWeightDifference])
      @lab = attributes [:lab]
      @peaberry_screen_sizes = attributes [:peaberryScreenSizes]
      @quaker_count = attributes[:quakerCount]
      @screen_size_summary = attributes[:screenSizeSummary]
      @screen_sizes = attributes[:screenSizes]
      @smell = attributes[:smell]
      @water_activity = attributes[:waterActivity]    
    end



  end
end
  
