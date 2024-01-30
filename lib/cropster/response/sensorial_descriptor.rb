# Converts a Hash into a Cropster::Response::SensorialDescriptor object
#

module Cropster::Response
  class SensorialDescriptor < Cropster::Response::FormattedResponseItem
    attr_accessor :intensity, :is_positive, :flavor_id, :sensorial_result_item


    def load_from_data(data)
      super
      @sensorial_result_item = ''
      load_path(date[:relationships][:sensorialResultItem])
    end

    def load_path(item)
      return if item.nil?
      @sensorial_result_item = item[:data][:id]
    
    end


    def load_attributes(attributes)
      return if attributes.nil?

      @intensity = attributes[:intensity]
      @is_positive = attributes[:isPositive]
    end
  end
end
