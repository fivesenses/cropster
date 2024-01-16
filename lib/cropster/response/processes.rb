##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Processes < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :created, :final_form, :final_weight_amount, :final_weight_unit, :final_weight_amount_si, :intermediate_form, :intermediate_weight_source_amount, :intermediate_weight_source_unit, :intermediate_weight_source_amount_si, :intermediate_weight_target_amount, :intermediate_weight_target_unit, :intermediate_weight_target_amount_si, :is_active, :last_modified, :processin_method, :received_form, :received_weight_amount, :received_weight_unit, :received_weight_amount_si

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @created = attributes[:created]
      @final_form = attributes[:finalForm]
      #finalWeight OBJECT measure
      @final_weight_amount = attributes[:finalWeight][:amount]
      @final_weight_unit = attributes[:finalWeight][:unit]
      @final_weight_amount_si = attributes[:finalWeight][:amountSI]
      @intermediate_form = attributes[:intermediateForm]
      #intermediateWeightSource OBJECT measure
      @intermediate_weight_source_amount = attributes[:intermediateWeightSource][:amount]
      @intermediate_weight_source_unit = attributes[:intermediateWeightSource][:unit]
      @intermediate_weight_source_amount_si = attributes[:intermediateWeightSource][:amountSI]
      #intermediateWeightTarget OBJECT measure
      @intermediate_weight_target_amount = attributes[:intermediateWeightTarget][:amount]
      @intermediate_weight_target_unit = attributes[:intermediateWeightTarget][:unit]
      @intermediate_weight_target_amount_si = attributes[:intermediateWeightTarget][:amountSI]
      @is_active = attributes[:isActive]
      @last_modified = attributes[:lastModified]
      @processing_method = attributes[:processingMethod]
      @receiveds_form = attributes[:receivedForm]
      #receivedWeight OBJECT measure
      @received_weight_amount = attributes[:receivedWeight][:amount]
      @received_weight_unit = attributes[:receivedWeight][:unit]
      @received_weight_amount_si = attributes[:receivedWeight][:amountSI]
      
    end
  end
end
  











