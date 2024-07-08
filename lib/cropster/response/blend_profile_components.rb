##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class BlendProfileComponents < Cropster::Response::FormattedResponseItem
    attr_accessor :percentage

    def load_attributes(attributes)
      return if attributes.nil?

      @percentage = attributes[:percentage]


    end
  end
end