# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class BatchMixes < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :is_active, :is_committed

    def load_attributes(attributes)
      return if attributes.nil?

      @name = attributes[:name]
      @is_active = attributes[:is_active]
      @is_committed = attributes[:is_committed]

    end
  end
end