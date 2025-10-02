# frozen_string_literal: true

# Provides an interface to the Cropster API Adjust Weight Actions system
#
# https://cropstercore.docs.apiary.io/#reference/production/adjust-weight-actions
#
# Note: This is an action endpoint - only POST operation is supported
#
module Cropster
  class AdjustWeightActions < Cropster::Base
    # POSTs a new Adjust Weight Action to Cropster
    # This action adjusts the weight of a lot. currentWeight must match the lot's
    # actualWeight to prevent updates based on outdated data.
    #
    # @param data [Hash] the Adjust Weight Action data containing:
    #   - comment: optional comment (not allowed if isResetInitialWeight is true)
    #   - currentWeight: required, current weight of lot (guard against outdated data)
    #   - isResetInitialWeight: optional, resets the initial weight if true
    #   - newWeight: required, desired new weight of the lot
    #   - lot: required relationship, the lot to update
    # @return [Cropster::Response::AdjustWeightActions]
    def create_adjust_weight_action(data)
      create("adjust-weight-actions", data).first
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("AdjustWeightActions", data_set(response))
        .compiled_data
    end
  end
end
