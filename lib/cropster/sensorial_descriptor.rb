# frozen_string_literal: true

# Provides an interface to the Cropster API Sensorial Descriptor system
#
# https://cropstercore.docs.apiary.io/#reference/quality/sensorial-descriptors
#
module Cropster
  class SensorialDescriptor < Cropster::Base
    # Find a single Sensorial Descriptor
    #
    # @param id [String] the id of the required Sensorial Descriptor
    # @return [Cropster::Response::SensorialDescriptor]
    def sensorial_descriptor(id)
      find_by_id("sensorial-descriptors", id).first
    end

    # Find a collection of Sensorial Descriptor objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SensorialDescriptor objects
    def sensorial_descriptors(opts = {})
      find_collection("sensorial-descriptors", opts)
    end

    # Find multiple Sensorial Descriptor objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::SensorialDescriptor objects
    def sensorial_descriptors_by_ids(ids)
      find_by_ids("sensorial-descriptors", ids)
    end

    # POSTs a new Sensorial Descriptor to Cropster
    #
    # @param data [Hash] the new Sensorial Descriptor
    # @return [Cropster::Response::SensorialDescriptor]
    def create_sensorial_descriptor(data)
      create("sensorial-descriptors", data).first
    end

    # Updates an existing Sensorial Descriptor
    # Supports updating: intensity, isPositive
    #
    # @param id [String] the ID of the Sensorial Descriptor to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::SensorialDescriptor]
    def update_sensorial_descriptor(id, data)
      update("sensorial-descriptors", id, data).first
    end

    # Deletes a specific Sensorial Descriptor
    #
    # @param id [String] the ID of the Sensorial Descriptor to delete
    # @return [Boolean]
    def delete_sensorial_descriptor(id)
      delete("sensorial-descriptors", id)
    end

    # Helper method to get sensorial descriptors by URL
    #
    # @param url [String] the URL to fetch sensorial descriptors from
    # @return [Array] of Cropster::Response::SensorialDescriptor objects
    def sensorial_descriptor_by_url(url)
      get_all_by_url(url)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialDescriptor", data_set(response))
        .compiled_data
    end
  end
end
