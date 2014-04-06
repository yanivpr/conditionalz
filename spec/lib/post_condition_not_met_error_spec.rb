require 'conditionz/post_condition_not_met_error'

describe Conditionz::PostConditionNotMetError do

  it "should have correct message" do
    message = "some message"
    error = Conditionz::PostConditionNotMetError.new(message)

    error.message.should == message
  end
end