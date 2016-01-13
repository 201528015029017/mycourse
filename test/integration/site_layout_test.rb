require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_select "div.typediv", count: 9
    assert_select "li.active", count: 1
  end
end