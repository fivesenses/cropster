##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class StageRecords < Cropster::Response::FormattedResponseItem
    attr_accessor :duration,:created ,:end_date,:last_modified,:stage_name,:stage_target_duration,:stage_type,:start_date

    def load_attributes(attributes)
      return if attributes.nil?
      @duration = attributes[:duration]
      @created = attributes[:created]
      @end_date = attributes[:endDate]
      @last_modified = attributes[:lastModified]
      @stage_name = attributes[:stageName]
      @stage_target_duration = attributes[:stageTargetDuration]
      @stage_type = attributes[:stageType]
      @start_date = attributes[:startDate]
    end
  end
end
  