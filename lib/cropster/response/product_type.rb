productTypes

##
# Converts a Hash into a Cropster::Response::ProfileGroup object
#
module Cropster::Response
  class ProductTypes < Cropster::Response::FormattedResponseItem
    attr_accessor :att_id
    # @param attributes [Hash]
    def load_attributes(attributes)
     @att_id = attributes[:id]
    end
  end
end