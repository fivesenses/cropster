##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class StageMeasurementRequirements < Cropster::Response::FormattedResponseItem
    attr_accessor  :minimum_readings, :last_modified, :created, :type

    def load_attributes(attributes)
      return if attributes.nil?
      @minimum_readings = attributes[:minimumReadings]
      @created = attributes[:created]
      @type = attributes[:type]
      @last_modified = attributes[:lastModified]
    end
  end
end
  