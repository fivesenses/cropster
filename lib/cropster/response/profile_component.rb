##
# Converts a Hash into a Cropster::Response::ProfileComponent object
#
module Cropster::Response
  class ProfileComponent < Cropster::Response::FormattedResponseItem
    attr_accessor :percentage, :name, :profile_id, :profile_type

    def load_attributes(attributes)
      return if attributes.nil?

      @percentage = attributes[:percentage]
      @name = attributes[:name]
    end

    # @param relationships [Hash]
    def load_relationships(relationships)
      return if relationships.nil?

      @profile = relationships[:profile]
      load_profile(@profile)
    end

    # @param profile [Hash]
    def load_profile(profile)
      return if profile.nil?

      @profile_id = profile[:data][:id]
      @profile_type = profile[:data][:type]
    end
  end
end
