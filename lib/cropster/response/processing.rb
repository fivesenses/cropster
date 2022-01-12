##
# Converts a Hash into a Cropster::Response::Processing object that represents
# a Roast instance
#
module Cropster::Response
  class Processing < Cropster::Response::FormattedResponseItem
    attr_accessor :worker, :started_at, :ended_at, :duration,
      :notes, :start_weight, :end_weight, :measures, :comments

    def load_from_data(data)
      super
      @comments = []
      @measures = []
      load_measures(data[:relationships][:processingMeasures])
      load_comments(data[:relationships][:processingComments])
    end

    def load_attributes(attributes)
      @worker = attributes[:worker]
      @started_at = load_date(attributes[:startDate])
      @ended_at = load_date(attributes[:endDate])
      @duration = attributes[:duration]
      @notes = attributes[:notes]
      @start_weight = load_weight(attributes[:startWeight])
      @end_weight = load_weight(attributes[:endWeight])
    end

    def load_measures(measures)
      return if measures.nil?
      return if measures[:data].nil?

      @measures = []
      measures[:data].each do |measure|
        @measures << measure[:id]
      end
    end

    def load_comments(comments)
      return if comments.nil?
      return if comments[:data].nil?

      @comments = []
      comments[:data].each do |comment|
        @comments << comment[:id]
      end
    end

    def total_green_weight_grams
      sources.sum { |s| s.weight.grams }
    end

    def total_roasted_weight_grams
      weight.grams
    end

    def green_to_roasted_weight_loss_percentage
      ((1 - total_roasted_weight_grams / total_green_weight_grams) * 10000).round / 100.0
    end
  end
end
