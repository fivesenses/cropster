##
# Converts a Hash into a Cropster::Response::Base object
# Base is the parent element to the child 
#

module Cropster::Response
    class Parent
        attr_accessor :id
        def initialize(data)
            load_from_data(data)
        end

        def load_from_data(data)
            if data.nil?
                @id = ""
            else
                @id = data[:id] ||= ""
            end
        end
    end
end