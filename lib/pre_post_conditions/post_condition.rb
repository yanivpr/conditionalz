require_relative 'condition_base'

module PrePostConditions

  class PostCondition

    def self.ensure predicate, message = 'Postcondition not met'
      ConditionBase.verify predicate, PostConditionNotMetError, message
    end

  end
end
