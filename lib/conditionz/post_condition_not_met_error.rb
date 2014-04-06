require_relative 'condition_base'

module Conditionz

  # Raised when a postcondition is not met
  class PostConditionNotMetError < StandardError
    attr_reader :message
    def initialize(message = '')
      @message = message
    end
  end

end