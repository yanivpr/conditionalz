require '../../lib/pre_post_conditions/pre_condition'

describe PrePostConditions::PreCondition do

  let(:predicate) { true } #doesn't matter for these tests

  it "should call the condition base with pre condition error and message" do
    message = "some message"
    PrePostConditions::ConditionBase.should_receive(:verify).
        with(predicate, PrePostConditions::PreConditionNotMetError, message)

    PrePostConditions::PreCondition.require predicate, message
  end

  it "should call the condition base with pre condition error and message_proc" do
    message_proc = Proc.new { "some message" }
    PrePostConditions::ConditionBase.should_receive(:verify).
        with(predicate, PrePostConditions::PreConditionNotMetError, message_proc)

    PrePostConditions::PreCondition.require predicate, message_proc
  end
end