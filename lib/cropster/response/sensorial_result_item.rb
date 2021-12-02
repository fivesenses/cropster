# converts a Hash into a Cropster::SensorialResultItem object

module Cropster::Response
  class SensorialResultItem < Cropster::Response::FormattedResponseItem
    attr_accessor :calculated_quality, :intensity, :quality

    def load_attributes(attributes)
      return if attributes.nil?

      @calculated_quality = attributes["calculatedQuality"]
      @intensity = attributes["intensity"]
      @quality = attributes["quality"]
    end
  end
end
