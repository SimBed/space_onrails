require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = users(:michael)
    @nonadmin_user = users(:archer)
    @nonadmin_user_id = @admin_user.id
    @package = packages(:Aerial1)
    @attendance = attendances(:three)
  end

  test "only if admin logged in should be able to create attendances" do
    assert_no_difference 'Attendance.count' do
      post attendances_path, params: { attendance: { members_package: @package.id, date: "2018-01-02"} }
    end
  end

  test "only if admin logged in should be able to destroy attendances" do
  get user_path(@nonadmin_user)
  assert_no_difference 'Attendance.count' do
    delete attendance_path(@attendance)
    end
  assert_redirected_to root_url
  end
  
  test "admin should be able to create attendance for non-admin" do
    log_in_as(@admin_user)
    assert_difference 'Attendance.count', 1 do
      post attendances_path, params: { attendance: {members_package: @package.id, date: "2018-01-02"} }
    end
#   get user_path(@nonadmin_user_id)
    follow_redirect!
    assert_select 'span.packageinfo', date: @attendance.date
  end

  test "admin should be able to destroy attendances of non-admin" do
    log_in_as(@admin_user)
    #this line accesses the Users controller show action which stores profiled member in a session and is needed to not be nil in testing as after deleting the method redirects to this members profile
    get user_path(@nonadmin_user)
    assert_difference 'Attendance.count', -1 do
    delete attendance_path(@attendance)
    end
    assert_redirected_to @nonadmin_user
  end  
end
