##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Receptions < Cropster::Response::FormattedResponseItem
    attr_accessor  :coffee_form, :is_active, :reception_date

    def load_attributes(attributes)
      return if attributes.nil?
      @coffee_form = attributes[:coffeeForm]
      @is_active = attributes[:isActive]
      @reception_date = attributes[:receptionDate]
      
    end
  end
end
  