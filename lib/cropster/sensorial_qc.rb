# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial QC system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-qcs
#
module Cropster
  class SensorialQc < Cropster::Base
    # Find a single Sensorial QC
    #
    # @param id [String] the id of the required Sensorial QC
    # @return [Cropster::Response::SensorialQc]
    def sensorial_qc(id)
      find_by_id("sensorial-qcs", id).first
    end

    # Find a collection of Sensorial QC objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialQc objects
    def sensorial_qcs(opts = {})
      find_collection("sensorial-qcs", opts)
    end

    # Find multiple Sensorial QC objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialQc objects
    def sensorial_qcs_by_ids(ids)
      find_by_ids("sensorial-qcs", ids)
    end

    # POSTs a new Sensorial QC to Cropster
    #
    # @param data [Hash] the new Sensorial QC
    # @return [Cropster::Response::SensorialQc]
    def create_sensorial_qc(data)
      create("sensorial-qcs", data).first
    end

    # Updates an existing Sensorial QC
    # Supports updating: category, description, isActive, lab, scheduleDate, weight, sensorialSheet
    #
    # @param id [String] the ID of the Sensorial QC to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialQc]
    def update_sensorial_qc(id, data)
      update("sensorial-qcs", id, data).first
    end

    # Deletes a specific Sensorial QC
    #
    # @param id [String] the ID of the Sensorial QC to delete
    # @return [Boolean]
    def delete_sensorial_qc(id)
      delete("sensorial-qcs", id)
    end

    # Finds a paginated collection of Sensorial QC objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialQc objects
    def sensorial_qcs_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("sensorial-qcs", page_number, page_size, opts)
    end

    # Finds the next page of Sensorial QC results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::SensorialQc objects
    def sensorial_qcs_next_page(current_page, opts = {})
      find_next_page("sensorial-qcs", current_page, opts)
    end

    # Finds all Sensorial QCs by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::SensorialQc objects
    def all_sensorial_qcs(opts = {}, max_pages = nil)
      find_all_pages("sensorial-qcs", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialQc", data_set(response))
        .compiled_data
    end
  end
end
