require "test_helper"

class RedirectToTest < ActionDispatch::IntegrationTest

  test "test register fail from dish#index to user#login" do
    get root_path
    assert_no_difference 'User.count' do
    post users_path, user: { name: "",
    email: "1234@invaid",
    password: "nono",
    password_confirmation: "nonono" }
    end
    assert_template 'users/fails'
  end

  test "test register success from dish#index to user#register" do
    get root_path
    name = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: { name: name,
                        email: email,
                        password: password,
                        password_confirmation: password }
    end
    assert_template 'dishes/index'
  end
  
  test "test index redirect to topic" do
    get root_path
    get topics_path
    assert_template 'topics/index'
  end
  
  test "test index redirect_to dishdetails" do
    get root_path
    assert_response :success
  end
end