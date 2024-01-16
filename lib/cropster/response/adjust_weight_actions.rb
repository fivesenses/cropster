module Cropster::Response
  class AdjustWeightActions < Cropster::Response::FormattedResponseItem
    attr_accessor 
    :comment,
    :current_weight_amount,
    :current_weight_unit,
    :new_weight_amount,
    :new_weight_unit,
    :is_reset_initial_weight,

    def load_attributes(attributes)
      return if attributes.nil?

      @comment = attributes[:comment]
      @current_weight_amount = attributes[:currentWeight][:amount]
      @current_weight_unit = attributes[:currentWeight][:unit]
      @new_weight_amount = attributes[:newWeight][:amount]
      @new_weight_unit = attributes[:newWeight][:unit]
      @is_reset_initial_weight = attributes[:isResetInitialWeight]

    end
  end
end