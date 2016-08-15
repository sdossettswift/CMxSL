require "test_helper"

describe List do
  let(:list) { List.new }

  it "must be valid" do
    value(list).must_be :valid?
  end
end
