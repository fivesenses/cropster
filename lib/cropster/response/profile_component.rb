##
# Converts a Hash into a Cropster::Response::ProfileComponent object
#
module Cropster::Response
  class ProfileComponent < Cropster::Response::FormattedResponseItem
    attr_accessor :percentage, :name

    def load_attributes(attributes)
      return if attributes.nil?

      @percentage = attributes[:percentage]
      @name = attributes[:name]
    end
  end
end
