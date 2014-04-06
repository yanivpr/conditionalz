require_relative 'condition_base'

module Conditionz

  # Raise postcondition error when +predicate+ is false
  class PostCondition

    # Raise postcondition error if predicate is false. Otherwise do nothing
    #
    # ==== Attributes
    #
    # * +predicate+ - a boolean expression to eval
    # * +message+ - Error message to raise
    #
    # ==== Examples
    #
    # PostCondition.ensure age > 0, "Age should have been positive"
    # PostCondition.ensure age > 0
    #
    def self.ensure predicate, message = 'Postcondition not met'
      ConditionBase.verify predicate, PostConditionNotMetError, message
    end

  end
end
