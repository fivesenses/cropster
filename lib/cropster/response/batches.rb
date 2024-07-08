##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Batches < Cropster::Response::FormattedResponseItem
    attr_accessor  :id_tag, :active, :crop_year, :harvest_date, :is_piled, :milling_date, :notes, :part, :reception_date, :storage_date, :final_weight,:final_weight_override,:intermediate_weight,:intermediate_weight_source_override,:received_weight_override,:intermediate_weight_target_override,:received_weight,


    def load_attributes(attributes)
      return if attributes.nil?

      @id_tag = attributes[:idTag]
      @active = attributes[:active]
      @crop_year = attributes[:cropYear]
      @harvest_date = attributes[:harvestDate]

      @final_weight = load_weight(attributes[:finalWeight])
      @final_weight_override = load_weight(attributes[:finalWeightOverride])
      @intermediate_weight = load_weight(attributes[:intermediateWeight])
      @intermediate_weight_source_override = load_weight(attributes[:intermediateWeightSourceOverride])
      @received_weight_override = load_weight(attributes[:receivedWeightOverride])
      @intermediate_weight_target_override = load_weight(attributes[:intermediateWeightTargetOverride])
      @received_weight = load_weight(attributes[:receivedWeight])
      
      @is_piled = attributes[:isPiled]
      @milling_date = attributes[:millingDate]
      @notes = attributes[:notes]
      @part = attributes[:part]
      @reception_date = attributes[:receptionDate]
      @storage_date = attributes[:storageDate]
    end
  end
end
