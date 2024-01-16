##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class StageRecordMeasurementRequirements < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :minimum_readings, 
    :created, 
    :type 
    def load_attributes(attributes)
      return if attributes.nil?
      @minimum_readings = attributes[:minimumReadings]
      @created = attributes[:created]
      @type = attributes[:type]
      
    end
  end
end
  