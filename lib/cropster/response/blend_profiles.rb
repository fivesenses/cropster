##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class BlendProfiles < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :name,
    :created_date,
    :is_active,
    :is_archived,
    :last_modified_date,

    def load_attributes(attributes)
      return if attributes.nil?
      
      @name = attributes[:name]
      @created_date = attributes[:createdDate]
      @is_active = attributes[:isActive]
      @is_archived = attributes[:isArchived]
      @last_modified_date = attributes[:lastModifiedDate]

    end
  end
end
