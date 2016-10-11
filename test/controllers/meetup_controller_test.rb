require "test_helper"

describe MeetupController do
  it "should get new" do
    get meetup_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get meetup_edit_url
    value(response).must_be :success?
  end

  it "should get index" do
    get meetup_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get meetup_show_url
    value(response).must_be :success?
  end

end
