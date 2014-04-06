require_relative 'condition_base'

module Conditionz

  # Raise assertion error when +predicate+ is false
  class Assert

    # Raise assertion error if predicate is false. Otherwise do nothing
    #
    # ==== Attributes
    #
    # * +predicate+ - a boolean expression to eval
    # * +message+ - Error message to raise
    #
    # ==== Examples
    #
    # Assert.that age > 0, "Age should have been positive"
    # Assert.that age > 0
    #
    def self.that predicate, message = 'Assertion failed'
      ConditionBase.verify predicate, AssertionError, message
    end

  end
end
