require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  
  test "show topic list,could enter in index controller" do
    get :index
    assert_response :success
  end


  test "clickzan could enter in clickzan method" do
    get :clickzan
    assert_response :success
  end
  
  test "create a new topic,could enter in create method" do
    get :create
    assert_response :success
  end
end
