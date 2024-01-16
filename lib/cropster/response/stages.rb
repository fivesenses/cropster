##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Stages < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :created, :last_modified, :sort, :targe_duration, :type

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @created = attributes[:created]
      @last_modified = attributes[:lastModified]
      @sort = attributes[:sort]
      @targe_duration = attributes[:targetDuration]
      @type = attributes[:type]
    end
  end
end
  