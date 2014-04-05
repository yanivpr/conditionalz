require '../../lib/pre_post_conditions/post_condition'

describe PrePostConditions::PostCondition do

  let(:predicate) { true } #doesn't matter for these tests

  it "should call the condition base with pre condition error and message" do
    message = "some message"
    PrePostConditions::ConditionBase.should_receive(:verify).
        with(predicate, PrePostConditions::PostConditionNotMetError, message)

    PrePostConditions::PostCondition.require predicate, message
  end

  it "should call the condition base with pre condition error and message_proc" do
    message_proc = Proc.new { "some message" }
    PrePostConditions::ConditionBase.should_receive(:verify).
        with(predicate, PrePostConditions::PostConditionNotMetError, message_proc)

    PrePostConditions::PostCondition.require predicate, message_proc
  end
end