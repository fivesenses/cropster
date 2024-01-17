##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class StageRecordMeasurements < Cropster::Response::FormattedResponseItem
    attr_accessor  :created, :date, :lastModified, :type, :value

    def load_attributes(attributes)
      return if attributes.nil?
      @created = attributes[:created]
      @date = attributes[:date]
      @lastModified = attributes[:lastModified]
      @type = attributes[:type]
      @value = load_weight(attributes[:value])      
    end
  end
end
  