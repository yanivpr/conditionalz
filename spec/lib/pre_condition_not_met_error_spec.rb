require 'conditionz/pre_condition_not_met_error'

describe Conditionz::PreConditionNotMetError do

  it "should have correct message" do
    message = "some message"
    error = Conditionz::PreConditionNotMetError.new(message)

    error.message.should == message
  end
end