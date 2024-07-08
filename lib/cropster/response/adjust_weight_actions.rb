module Cropster::Response
  class AdjustWeightActions < Cropster::Response::FormattedResponseItem
    attr_accessor :comment, :is_reset_initial_weight ,:current_weight ,:new_weight

    def load_attributes(attributes)
      return if attributes.nil?
      @comment = attributes[:comment]
      @current_weight = load_weight(attributes[:currentWeight])
      @new_weight = load_weight(attributes[:newWeight])
      @is_reset_initial_weight = attributes[:isResetInitialWeight]

    end
  end
end