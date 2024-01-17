#
# Provides an interface to the Cropster API for the Sensorial QC module
#

module Cropster
    class ProfileGroups < Cropster::Base
      # Find a single SensorialQc
      #
      # @param [String] id
      # @return [Cropster::Response::SensorialQc]
      def profileGroup(id)
        find_by_id("profileGroups", id).first
      end
  
      def profileGroups(opts = {})
        find_collection("profileGroups", opts)
      end
  
      def process(response)
        Cropster::Response::ResponseHandler
          .new("ProfileGroups", data_set(response))
          .compiled_data
      end
    end
  end