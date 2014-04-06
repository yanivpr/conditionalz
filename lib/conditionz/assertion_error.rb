require_relative 'condition_base'

module Conditionz

  # Raised when assertion failed
  class AssertionError < StandardError
    attr_reader :message
    def initialize(message = '')
      @message = message
    end
  end

end