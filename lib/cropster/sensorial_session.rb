# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Session system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-sessions
#
module Cropster
  class SensorialSession < Cropster::Base
    # Find a single Sensorial Session
    #
    # @param id [String] the id of the required Sensorial Session
    # @return [Cropster::Response::SensorialSession]
    def sensorial_session(id)
      find_by_id("sensorial-sessions", id).first
    end

    # Find a collection of Sensorial Session objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialSession objects
    def sensorial_sessions(opts = {})
      find_collection("sensorial-sessions", opts)
    end

    # Find multiple Sensorial Session objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialSession objects
    def sensorial_sessions_by_ids(ids)
      find_by_ids("sensorial-sessions", ids)
    end

    # POSTs a new Sensorial Session to Cropster
    #
    # @param data [Hash] the new Sensorial Session
    # @return [Cropster::Response::SensorialSession]
    def create_sensorial_session(data)
      create("sensorial-sessions", data).first
    end

    # Updates an existing Sensorial Session
    # Supports updating: name, codeType, isBlind, lab, scheduleDate, sensorialQcOrder, state
    #
    # @param id [String] the ID of the Sensorial Session to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialSession]
    def update_sensorial_session(id, data)
      update("sensorial-sessions", id, data).first
    end

    # Deletes a specific Sensorial Session
    #
    # @param id [String] the ID of the Sensorial Session to delete
    # @return [Boolean]
    def delete_sensorial_session(id)
      delete("sensorial-sessions", id)
    end

    # Finds a paginated collection of Sensorial Session objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialSession objects
    def sensorial_sessions_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("sensorial-sessions", page_number, page_size, opts)
    end

    # Finds the next page of Sensorial Session results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialSession objects
    def sensorial_sessions_next_page(current_page, opts = {})
      find_next_page("sensorial-sessions", current_page, opts)
    end

    # Finds all Sensorial Sessions by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::SensorialSession objects
    def all_sensorial_sessions(opts = {}, max_pages = nil)
      find_all_pages("sensorial-sessions", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialSession", data_set(response))
        .compiled_data
    end
  end
end
