require "test_helper"

describe TestcController do
  it "should get home" do
    get :home
    value(response).must_be :success?
  end

  it "should get help" do
    get :help
    value(response).must_be :success?
  end

end
