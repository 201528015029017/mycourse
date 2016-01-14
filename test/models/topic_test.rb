require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  def setup
    @dish = Dish.new(dishname: "Example dish", price: "4.5", dining: "1")
  end
  test "should be valid" do
    assert @dish.valid?
  end
  
  test "dishname should be present" do
    @dish.dishname = " "
    assert_not @dish.valid?
  end
  
  test "price should be present" do
    @dish.price = " "
    assert_not @dish.valid?
  end
  
  test "dining should be present" do
    @dish.dining = " "
    assert_not @dish.valid?
  end
  
  test "dishname could be chinese name" do
    @dish.dining = "青椒肉丝"
    assert @dish.valid?
  end
  
  test "dishname should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

end
