require '../../lib/pre_post_conditions/condition_base'

describe PrePostConditions::ConditionBase do

  context "predicate is true" do
    let(:true_predicate) { true }

    it "should not raise precondition error" do
      message = "custom pre condition message"

      expect {
        PrePostConditions::ConditionBase.verify true_predicate,
                                                PrePostConditions::PreConditionNotMetError,
                                                message
      }.not_to raise_error
    end

    it "should not raise postcondition error" do
      message = "custom post condition message"

      expect {
        PrePostConditions::ConditionBase.verify true_predicate,
                                                PrePostConditions::PostConditionNotMetError,
                                                message
      }.to_not raise_error
    end
  end

  context "predicate is false" do
    let(:false_predicate) { false }

    context "precondition" do
      it "should raise error with given message" do
        message = "custom pre condition message"

        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PreConditionNotMetError,
                                                  message
        }.to raise_error PrePostConditions::PreConditionNotMetError, message
      end

      it "should raise error with given message proc" do
        message = "custom pre condition message"
        message_proc = Proc.new { message }

        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PreConditionNotMetError,
                                                  message_proc
        }.to raise_error PrePostConditions::PreConditionNotMetError, message
      end

      it "should raise error with default message" do
        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PreConditionNotMetError
        }.to raise_error PrePostConditions::PreConditionNotMetError, 'Condition not met'
      end
    end

    context "postcondition" do
      it "should raise error with given message" do
        message = "custom post condition message"

        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PostConditionNotMetError,
                                                  message
        }.to raise_error PrePostConditions::PostConditionNotMetError, message
      end

      it "should raise error with given message proc" do
        message = "custom post condition message"
        message_proc = Proc.new { message }

        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PostConditionNotMetError,
                                                  message_proc
        }.to raise_error PrePostConditions::PostConditionNotMetError, message
      end

      it "should raise error with default message" do
        expect {
          PrePostConditions::ConditionBase.verify false_predicate,
                                                  PrePostConditions::PostConditionNotMetError
        }.to raise_error PrePostConditions::PostConditionNotMetError, 'Condition not met'
      end
    end

  end
end