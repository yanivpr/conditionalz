require 'conditionz/condition_base'

describe Conditionz::ConditionBase do

  context "predicate is true" do
    let(:true_predicate) { true }

    it "should not raise precondition error" do
      message = "custom pre condition message"

      expect {
        Conditionz::ConditionBase.verify true_predicate,
                                                Conditionz::PreConditionNotMetError,
                                                message
      }.not_to raise_error
    end

    it "should not raise postcondition error" do
      message = "custom post condition message"

      expect {
        Conditionz::ConditionBase.verify true_predicate,
                                                Conditionz::PostConditionNotMetError,
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
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PreConditionNotMetError,
                                                  message
        }.to raise_error Conditionz::PreConditionNotMetError, message
      end

      it "should raise error with given message proc" do
        message = "custom pre condition message"
        message_proc = Proc.new { message }

        expect {
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PreConditionNotMetError,
                                                  message_proc
        }.to raise_error Conditionz::PreConditionNotMetError, message
      end

      it "should raise error with default message" do
        expect {
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PreConditionNotMetError
        }.to raise_error Conditionz::PreConditionNotMetError, 'Condition not met'
      end
    end

    context "postcondition" do
      it "should raise error with given message" do
        message = "custom post condition message"

        expect {
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PostConditionNotMetError,
                                                  message
        }.to raise_error Conditionz::PostConditionNotMetError, message
      end

      it "should raise error with given message proc" do
        message = "custom post condition message"
        message_proc = Proc.new { message }

        expect {
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PostConditionNotMetError,
                                                  message_proc
        }.to raise_error Conditionz::PostConditionNotMetError, message
      end

      it "should raise error with default message" do
        expect {
          Conditionz::ConditionBase.verify false_predicate,
                                                  Conditionz::PostConditionNotMetError
        }.to raise_error Conditionz::PostConditionNotMetError, 'Condition not met'
      end
    end

  end
end