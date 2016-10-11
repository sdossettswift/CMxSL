require "test_helper"

describe SmGroupController do
  it "should get new" do
    get sm_group_new_url
    value(response).must_be :success?
  end

  it "should get index" do
    get sm_group_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get sm_group_show_url
    value(response).must_be :success?
  end

end
