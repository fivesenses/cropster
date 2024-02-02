##
# Provides the interface between the results from the API query and the
# conversion of the Hash to a Ruby object
#
module Cropster::Response
  class ResponseHandler
    attr_accessor :data_set
    attr_accessor :compiled_data

    # Constructor
    # @param klass [String] the class being converted
    # @data_set [Hash | Array] the result from the API
    def initialize(klass, data_set)
      @compiled_data = []
      @data_set = data_set
      data = compile_data(klass)
      puts "coccc #{data}"
    end

    # Builds the object to be compiled
    # @param klass [String] the class being converted
    def compile_data(klass)
      className = klass_check[klass] ? klass_check[klass] : klass
      model = Object.const_get("Cropster::Response::" + className)

      process(model, @data_set)
      @compiled_data
    end

    def klass_check
      {
        "PhysicalSheetDefects" => "Defects"
      }
    end

    # Processes the Hash or Array from the API into ruby objects
    # @param model [Object] the object being constructed
    # @data_set [Hash | Array] the data to be converted
    def process(model, data_set)
      if @data_set.is_a?(Array)
        @data_set.each do |data|
          process_data(model, data)
        end
      else
        process_data(model, @data_set)
      end
    end

    # Converts the Hash into symbols and then converts the object
    # @param model [Object] the object being constructed
    # @param data [Hash] the data to be converted
    def process_data(model, data)
      puts "model => #{model}   data => #{data}"
      data.deep_symbolize_keys!
      puts "DEEP SYMBOL KEYS #{data.deep_symbolize_keys!}"
      puts " jfkd;akd f"
      a = Cropster::Response::Defects.new()
      puts 'fdad'
      b = Cropster::Response::Defects.new(data)
      puts "a #{a} ||  b#{b}"
      puts "fdad"
      
      build = model.new(data);
      puts "YES #{build}"
      
      @compiled_data << build
      puts "compile data here -> #{@compiled_data}"
    end
  end
end
