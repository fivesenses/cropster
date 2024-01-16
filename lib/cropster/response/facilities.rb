##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Facilities < Cropster::Response::FormattedResponseItem
    attr_accessor :acronym, :is_active

    def load_attributes(attributes)
      return if attributes.nil?

      @acronym = attributes[:acronym]
      @is_active = attributes[:isActive]

    end
  end
end