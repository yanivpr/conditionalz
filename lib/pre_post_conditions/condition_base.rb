require_relative 'pre_condition_not_met_error'
require_relative 'post_condition_not_met_error'

module PrePostConditions

  # Raise error when +predicate+ is false
  class ConditionBase

    # Raise error if predicate is false. Otherwise do nothing
    #
    # ==== Attributes
    #
    # * +predicate+ - a boolean expression to eval
    # * +error_class+ - Class of the error to raise
    # * +message+ - Error message to raise
    #
    # ==== Examples
    #
    # ConditionBase.verify age > 0, PrePostConditions::PreCondition, "Age must be positive"
    # ConditionBase.verify age > 0, PrePostConditions::PreCondition
    #
    def self.verify predicate, error_class, message = 'Condition not met'
      return if predicate

      error_message = message.is_a?(String) ? message : message.call
      raise error_class, error_message
    end

  end

end