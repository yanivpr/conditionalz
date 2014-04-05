require_relative 'condition_base'

module PrePostConditions

  class PostCondition

    def self.require predicate, message = 'Postcondition not met'
      ConditionBase.verify predicate, PostConditionNotMetError, message
    end

  end
end
