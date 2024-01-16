##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Batches < Cropster::Response::FormattedResponseItem
    attr_accessor  :id_tag, :active, :crop_year, :harvest_date, :final_weight_amount, :final_weight_unit, :final_weight_override_amount, :final_weight_override_unit, :intermediate_weight_amount, :intermediate_weight_unit, :intermediate_weight_source_override_amount, :intermediate_weight_source_override_unit, :intermediate_weight_target_override_amount, :intermediate_weight_target_override_unit, :received_weight_amount, :received_weight_unit, :received_weight_override_amount, :received_weight_override_unit, :is_piled, :milling_date, :notes, :part, :reception_date, :storage_date

    def load_attributes(attributes)
      return if attributes.nil?

      @id_tag = attributes[:idTag]
      @active = attributes[:active]
      @crop_year = attributes[:cropYear]
      @harvest_date = attributes[:harvestDate]
      @final_weight_amount = attributes[:finalWeight][:amount]
      @final_weight_unit = attributes[:finalWeight][:unit]
      @final_weight_override_amount = attributes[:finalWeightOverride][:amount]
      @final_weight_override_unit = attributes[:finalWeightOverride][:unit]
      @intermediate_weight_amount = attributes[:intermediateWeight][:amount]
      @intermediate_weight_unit = attributes[:intermediateWeight][:unit]
      @intermediate_weight_source_override_amount = attributes[:intermediateWeightSourceOverride][:amount]
      @intermediate_weight_source_override_unit = attributes[:intermediateWeightSourceOverride][:unit]
      @intermediate_weight_target_override_amount = attributes[:intermediateWeightTargetOverride][:amount]
      @intermediate_weight_target_override_unit = attributes[:intermediateWeightTargetOverride][:unit]
      @received_weight_amount = attributes[:receivedWeight][:amount]
      @received_weight_unit = attributes[:receivedWeight][:unit]
      @received_weight_override_amount = attributes[:receivedWeightOverride][:amount]
      @received_weight_override_unit = attributes[:receivedWeightOverride][:unit]
      @is_piled = attributes[:isPiled]
      @milling_date = attributes[:millingDate]
      @notes = attributes[:notes]
      @part = attributes[:part]
      @reception_date = attributes[:receptionDate]
      @storage_date = attributes[:storageDate]
    end
  end
end
