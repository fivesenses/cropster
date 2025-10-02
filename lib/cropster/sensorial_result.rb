# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Result system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-results
#
module Cropster
  class SensorialResult < Cropster::Base
    # Find a single Sensorial Result
    #
    # @param id [String] the id of the required Sensorial Result
    # @return [Cropster::Response::SensorialResult]
    def sensorial_result(id)
      find_by_id("sensorial-results", id).first
    end

    # Find a collection of Sensorial Result objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialResult objects
    def sensorial_results(opts = {})
      find_collection("sensorial-results", opts)
    end

    # Find multiple Sensorial Result objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialResult objects
    def sensorial_results_by_ids(ids)
      find_by_ids("sensorial-results", ids)
    end

    # POSTs a new Sensorial Result to Cropster
    #
    # @param data [Hash] the new Sensorial Result
    # @return [Cropster::Response::SensorialResult]
    def create_sensorial_result(data)
      create("sensorial-results", data).first
    end

    # Updates an existing Sensorial Result
    # Supports updating: calculatedScore, evaluationDate, evaluator, evaluatorScore,
    # isTakenIntoAccount, notes, roastLevel
    #
    # @param id [String] the ID of the Sensorial Result to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialResult]
    def update_sensorial_result(id, data)
      update("sensorial-results", id, data).first
    end

    # Deletes a specific Sensorial Result
    #
    # @param id [String] the ID of the Sensorial Result to delete
    # @return [Boolean]
    def delete_sensorial_result(id)
      delete("sensorial-results", id)
    end

    # Helper method to get sensorial results by URL
    #
    # @param url [String] the URL to fetch sensorial results from
    # @return [Array] of Cropster::Response::SensorialResult objects
    def sensorial_result_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialResult", data_set(response))
        .compiled_data
    end
  end
end
