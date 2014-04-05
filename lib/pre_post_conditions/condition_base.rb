require_relative 'precondition_not_met_error'
require_relative 'postcondition_not_met_error'

module PrePostConditions

  class ConditionBase

    def self.verify predicate, error_class, message = 'Condition not met'
      return if predicate

      error_message = message.is_a?(String) ? message : message.call
      raise error_class, error_message
    end

  end

end