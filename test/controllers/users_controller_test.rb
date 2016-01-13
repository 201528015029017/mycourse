require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "get user info [session]" do
    get :getUser
    assert_response :success
  end


  test "logout" do
    get :logout
    assert_response :success
  end
  
  
  
  test "create user info" do
    get :create
    assert_response :success
  end
end
