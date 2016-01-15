require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comments = Comment.new(userid: "1", dishid: "3", content: "aaaa", score: "2")
  end
  test "comments model should be valid" do
    assert @comments.valid?
  end
  
  test "comments' userid should be present" do
    @comments.userid = " "
    assert_not @comments.valid?
  end
  
  test "dishid should be present" do
    @comments.dishid = " "
    assert_not @comments.valid?
  end
  
  test "content should be present" do
    @comments.content = " "
    assert_not @comments.valid?
  end
  
  test "content could be chinese name" do
    @comments.content = "我想吃青椒肉丝"
    assert @comments.valid?
  end
  
  test "content should not be too long" do
    @comments.content = "a" * 501
    assert_not @comments.valid?
  end

end
