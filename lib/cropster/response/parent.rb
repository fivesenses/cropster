# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Parent object
# Parent is a helper for loading parent relationship data
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