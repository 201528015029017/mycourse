require 'test_helper'

class TopicTest < ActiveSupport::TestCase
    
  def setup
    @topic = Topic.new(userid: "1", content: "aaaa")
  end
  
  test "topic model should be valid" do
    assert @topic.valid?
  end
  
  test "userid should be present" do
    @topic.userid = " "
    assert_not @topic.valid?
  end
  
  test "content should be present" do
    @topic.content = " "
    assert_not @topic.valid?
  end
  
  test "topic content should not be too long" do
    @topic.content = "a" * 501
    assert_not @topic.valid?
  end
  

end
