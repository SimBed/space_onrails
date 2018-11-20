require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # previously before belongs_to/has_many association     ...= Package.new(...., user_id: @user.id)
    @package = @user.packages.build(name: "Aerial", instructor: "Lara", purchased_on: "2018-10-13",
    classes: 10, validity_type: "months" , validity_period: 1)
  end

  test "should be valid" do
    assert @package.valid?
  end

  test "user id should be present" do
    @package.user_id = nil
    assert_not @package.valid?
  end
  
  test "name should be present" do
    @package.name = "   "
    assert_not @package.valid?
  end
  
  test "name should not be too long" do
    @package.name = "a" * 51
    assert_not @package.valid?
  end
  
  test "purchased_on should be present" do
    @package.purchased_on = "   "
    assert_not @package.valid?
  end

  test "purchased_on should be date format" do
    @package.purchased_on = "2019/13/10"
    assert_not @package.valid?
  end
  
  test "classes should be between 1 and 1100" do
    @package.classes = 1200
    assert_not @package.valid?
    @package.classes = 0
    assert_not @package.valid?
  end
  
  test "order should be most recent first" do
    assert_equal packages(:most_recent), Package.first
  end  
  
  test "associated attendances should be destroyed" do
    @package.save
    @package.attendances.create!(date: "2018-10-13")
    assert_difference 'Package.count', -1 do
      @package.destroy
    end
  end
end
