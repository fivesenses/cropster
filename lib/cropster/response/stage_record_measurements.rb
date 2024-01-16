##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class StageRecordMeasurements < Cropster::Response::FormattedResponseItem
    attr_accessor  :created, :date, :lastModified, :type, :value_amount, :value_unit, :value_amount_si

    def load_attributes(attributes)
      return if attributes.nil?
      @created = attributes[:created]
      @date = attributes[:date]
      @lastModified = attributes[:lastModified]
      @type = attributes[:type]
      @value_amount = attributes[:value][:amount]
      @value_unit = attributes[:value][:unit]
      @value_amount_si = attributes[:value][:amountSI]
      
    end
  end
end
  