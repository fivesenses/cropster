# frozen_string_literal: true

# Provides an interface to the Cropster API Processing Comment system
#
# https://cropstercore.docs.apiary.io/#reference/processing/processing-comments
#
module Cropster
  class ProcessingComment < Cropster::Base
    # Find a single Processing Comment
    #
    # @param id [String] the id of the required Processing Comment
    # @return [Cropster::Response::ProcessingComment]
    def processing_comment(id)
      find_by_id("processing-comments", id).first
    end

    # Find a collection of Processing Comment objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingComment objects
    def processing_comments(opts = {})
      find_collection("processing-comments", opts)
    end

    # Find multiple Processing Comment objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::ProcessingComment objects
    def processing_comments_by_ids(ids)
      find_by_ids("processing-comments", ids)
    end

    # POSTs a new Processing Comment to Cropster
    #
    # @param data [Hash] the new Processing Comment
    # @return [Cropster::Response::ProcessingComment]
    def create_processing_comment(data)
      create("processing-comments", data).first
    end

    # Updates an existing Processing Comment
    # Supports updating: event, note, time
    #
    # @param id [String] the ID of the Processing Comment to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::ProcessingComment]
    def update_processing_comment(id, data)
      update("processing-comments", id, data).first
    end

    # Deletes a specific Processing Comment
    #
    # @param id [String] the ID of the Processing Comment to delete
    # @return [Boolean]
    def delete_processing_comment(id)
      delete("processing-comments", id)
    end

    # Helper method to get processing comments by URL
    #
    # @param url [String] the URL to fetch processing comments from
    # @return [Array] of Cropster::Response::ProcessingComment objects
    def processing_comments_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("ProcessingComment", data_set(response))
        .compiled_data
    end
  end
end
