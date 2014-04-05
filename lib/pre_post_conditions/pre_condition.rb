require_relative 'condition_base'

module PrePostConditions

  # Raise precondition error when +predicate+ is false
  class PreCondition

    # Raise precondition error if predicate is false. Otherwise do nothing
    #
    # ==== Attributes
    #
    # * +predicate+ - a boolean expression to eval
    # * +message+ - Error message to raise
    #
    # ==== Examples
    #
    # PreCondition.require age > 0, "Age must be positive"
    # PreCondition.require age > 0
    #
    def self.require predicate, message = 'Precondition not met'
      ConditionBase.verify predicate, PreConditionNotMetError, message
    end

  end
end
