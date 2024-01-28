##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class Processes < Cropster::Response::FormattedResponseItem
    attr_accessor  :name, :created, :final_form,  :intermediate_form,   :is_active, :last_modified, :processin_method, :received_form ,:intermediate_weight_source,:final_weight,:intermediate_weight_target,:received_weight


    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @created = attributes[:created]
      @final_form = attributes[:finalForm]
      @intermediate_form = attributes[:intermediateForm]
      
      @intermediate_weight_source = load_weight(attributes[:intermediateWeightSource])
      @final_weight = load_weight(attributes[:finalWeight])
      @intermediate_weight_target = load_weight(attributes[:intermediateWeightTarget])
      @received_weight = load_weight(attributes[:receivedWeight])
      
      @is_active = attributes[:isActive]
      @last_modified = attributes[:lastModified]
      @processing_method = attributes[:processingMethod]
      @receiveds_form = attributes[:receivedForm]
    end
  end
end
  











