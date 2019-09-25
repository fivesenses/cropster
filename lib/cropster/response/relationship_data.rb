#
# Parses the relationship results from Cropster
#

module Cropster::Response
  class RelationshipData
    attr_accessor :processed_data

    def initialize(raw_data)
      @processed_data = []
      @data = nil
      @raw_data = raw_data
    end

    def process
      return if @raw_data.nil?
      return if @raw_data[:data].nil?

      if @raw_data[:data].is_a?(Hash)
        @processed_data << @raw_data[:data][:id]
      end

      if @raw_data[:data].is_a?(Array)
        @raw_data[:data].each do |item|
          @processed_data << item[:id]
        end
      end
    end
  end
end
