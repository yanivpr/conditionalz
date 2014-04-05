module PrePostConditions

  class PreCondition

    def self.require predicate, message = 'Precondition not met'
      ConditionBase.verify predicate, PreconditionNotMetError, message
    end

  end
end
