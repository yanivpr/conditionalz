require 'conditionz/assertion_error'

describe Conditionz::AssertionError do

  it "should have correct message" do
    message = "some message"
    error = Conditionz::AssertionError.new(message)

    error.message.should == message
  end
end