# Converts a Hash into a Cropster::Response::SensorialDescriptor object
#

module Cropster::Response
  class SensorialDescriptor < Cropster::Response::FormattedResponseItem
    attr_accessor :intensity, :is_positive, :flavor_id

    def initialize(data)
      @values = []
      super(data)
    end

    def load_attributes(attributes)
      return if attributes.nil?

      @intensity = attributes[:intensity]
      @is_positive = attributes[:isPositive]
    end
  end
end
