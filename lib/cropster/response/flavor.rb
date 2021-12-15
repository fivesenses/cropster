# Converts a Hash into a Cropster::Response::Flavor object

module Cropster::Response
  class Flavor < Cropster::Response::FormattedResponseItem
    attr_accessor :is_dirty, :is_positive

    def load_attributes(attributes)
      @return if attributes.nil?

      @name = attributes[:name]
      @is_dirty = attributes[:isDirty]
      @is_positive = attributes[:isPositive]
    end
  end
end
