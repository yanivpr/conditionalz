require_relative 'condition_base'

module PrePostConditions

  class PreCondition

    def self.require predicate, message = 'Precondition not met'
      ConditionBase.verify predicate, PreConditionNotMetError, message
    end

  end
end
