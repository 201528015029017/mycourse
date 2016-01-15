require 'test_helper'

class ClickzanTest < ActiveSupport::TestCase
  def setup
    @clickzan = Clickzan.new(userid: "1", topicid: "2")
  end
  test "clickzan should be valid" do
    assert @clickzan.valid?
  end
  
  test "clickzan's userid should be present" do
    @clickzan.userid = " "
    assert_not @clickzan.valid?
  end
  
  test "price should be present" do
    @clickzan.topicid = " "
    assert_not @clickzan.valid?
  end
  


end
