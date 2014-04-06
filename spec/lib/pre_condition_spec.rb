require 'conditionz/pre_condition'

describe Conditionz::PreCondition do

  let(:predicate) { true } #doesn't matter for these tests

  it "should call the condition base with pre condition error and message" do
    message = "some message"
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::PreConditionNotMetError, message)

    Conditionz::PreCondition.require predicate, message
  end

  it "should call the condition base with pre condition error and message_proc" do
    message_proc = Proc.new { "some message" }
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::PreConditionNotMetError, message_proc)

    Conditionz::PreCondition.require predicate, message_proc
  end
end