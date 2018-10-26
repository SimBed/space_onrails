require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @package = packages(:Aerial1)
    @attendance = @package.attendances.build(date: "12/09/2018")
  end

  test "should be valid" do
    assert @attendance.valid?
  end

  test "package id should be present" do
    @attendance.package_id = nil
    assert_not @attendance.valid?
  end
  
   test "date should be present" do
    @attendance.date = "   "
    assert_not @attendance.valid?
  end
  
  test "order should be earliest date first" do
    assert_equal attendances(:earliest), Attendance.first
  end
end
