##
# Converts a Hash into a Cropster::Response::ProfileGroup object
#
module Cropster::Response
  class ProfileGroup < Cropster::Response::FormattedResponseItem
    attr_accessor :name ,:is_archived ,:created_date ,:last_modified_date ,:notes
    # @param attributes [Hash]
    def load_attributes(attributes)
     @name = attributes[:name]
     @is_archived = attributes[:isArchived]
     @created_date = attributes[:createdDate]
     @last_modified_date = attributes[:lastModifiedDate]
     @notes = attributes[:notes]
    end
  end
end