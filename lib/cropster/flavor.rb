# Provides an interface to the Cropster API Flavor system
#
# https://api-docs.cropster.com/#flavors

module Cropster
  class Flavor < Cropster::Base
    # @param id [String]
    # @return [Cropster::Response::Flavor]
    def flavor(id)
      find_by_id("flavor", id).first
    end

    # Find a collection of flavors
    #
    # @param opts [Hash]
    # @return [Array] of [Cropster::Response::Flavor] objects
    def flavors(opts = {})
      find_collection("flavors", opts)
    end

    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::ResponseHandler
        .new("Flavor", data_set(response))
        .compiled_data
    end
  end
end
