module Conditionz

  # Raised when a precondition is not met
  class PreConditionNotMetError < StandardError
    attr_reader :message
    def initialize(message = '')
      @message = message
    end
  end

end