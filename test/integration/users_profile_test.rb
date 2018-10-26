require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @package = packages(:Aerial1)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', "#{@user.name} | SpaceOnrails"
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    @user.packages.each do |package|
      assert_match package.name, response.body
    end
    @package.attendances.each do |attendance|
      assert_select 'span.packageinfo', date: attendance.date
     end
    
  end
end
