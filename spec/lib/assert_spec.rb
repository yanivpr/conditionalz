require 'conditionz/assert'

describe Conditionz::Assert do

  let(:predicate) { true } #doesn't matter for these tests

  it "should call the condition base with assert error and message" do
    message = "some message"
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::AssertionError, message)

    Conditionz::Assert.that predicate, message
  end

  it "should call the condition base with assert error and message_proc" do
    message_proc = Proc.new { "some message" }
    Conditionz::ConditionBase.should_receive(:verify).
        with(predicate, Conditionz::AssertionError, message_proc)

    Conditionz::Assert.that predicate, message_proc
  end
end