require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "index layout links" do
    get root_path
    assert_select "div.typediv", count: 9
    assert_select "li.active", count: 1
  end
  
  test "test login success from dish#index to user#login" do
    get root_path

    assert_response :success
  end

  test "test register from dish#index to user#register" do
    get root_path

    assert_response :success
  end
  
  test "test index redirect to topic" do
    get root_path
    get topics_path
    assert_response :success
  end
  
  test "test index redirect_to dishdetails" do
    get root_path
    assert_response :success
  end
end