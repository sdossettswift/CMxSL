require "test_helper"

describe SmGroup do
  let(:sm_group) { SmGroup.new }

  it "must be valid" do
    value(sm_group).must_be :valid?
  end
end
