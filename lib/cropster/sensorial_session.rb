#
# Provides an interface to teh SensorialSession API
#

module Cropster
  class SensorialSession < Cropster::Base
    # find a single sensorial session by id
    #
    # @param id [String] the id of the sensorial session
    # @return [Cropster::Response::SensorialSession]
    def sensorial_session(id)
      find_by_id("sensorialSessions", id).first
    end

    def sensorial_sessions(opts = {})
      find_collection("sensorialSessions", opts)
    end
  end
end
