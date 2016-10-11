require "test_helper"

describe SmEvent do
  let(:sm_event) { SmEvent.new }

  it "must be valid" do
    value(sm_event).must_be :valid?
  end
end
