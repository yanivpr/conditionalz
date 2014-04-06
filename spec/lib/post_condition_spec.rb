require 'conditionz/post_condition'

describe Conditionz::PostCondition do

  let(:predicate) { true } #doesn't matter for these tests

  it "should call the condition base with pre condition error and message" do
    message = "some message"
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::PostConditionNotMetError, message)

    Conditionz::PostCondition.ensure predicate, message
  end

  it "should call the condition base with pre condition error and message_proc" do
    message_proc = Proc.new { "some message" }
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::PostConditionNotMetError, message_proc)

    Conditionz::PostCondition.ensure predicate, message_proc
  end
end