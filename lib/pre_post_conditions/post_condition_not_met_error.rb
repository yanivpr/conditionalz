require_relative 'condition_base'

module PrePostConditions

  class PostConditionNotMetError < StandardError
    attr_reader :message
    def initialize(message = '')
      @message = message
    end
  end

end