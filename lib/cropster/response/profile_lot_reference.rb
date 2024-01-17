##
# Converts a Hash into a Cropster::Response::ProfileLotReference object
#
module Cropster::Response
  class ProfileLotReference < Cropster::Response::FormattedResponseItem
    attr_accessor :created_date
    # @param attributes [Hash]
    def load_attributes(attributes)
      @created_date = attributes[:createdDate]
    end
  end
end






