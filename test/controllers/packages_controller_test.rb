require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin_user = users(:michael)
    @nonadmin_user = users(:archer)
    @nonadmin_user_id = @admin_user.id
    @package = packages(:Aerial1)
  end

  test "only if admin logged in should be able to create packages" do
    assert_no_difference 'Package.count' do
      post packages_path, params: { package: { member: @nonadmin_user_id, name: "Aerial", instructor: "Lara", purchased_on: "2018-10-13", classes: 10 } }
    end
  end

  test "only if admin logged in should be able to destroy packages" do
   get user_path(@nonadmin_user)
   assert_no_difference 'Package.count' do
     delete package_path(@package)
    end
  end
  
  test "admin should be able to create package for non-admin" do
    log_in_as(@admin_user)
    assert_difference 'Package.count', 1 do
      post packages_path, params: { package: { member: @nonadmin_user_id, name: "Aerial", instructor: "Lara", purchased_on: "2018-10-13", classes: 10 } }
    end
    get user_path(@nonadmin_user_id)
    assert_match @package.name, response.body
  end

  test "admin should be able to destroy packages" do
    log_in_as(@admin_user)
    #this line accesses the Users controller show action which stores profiled member in a session and is needed to not be nil in testing as after deleting the method redirects to this members profile
    get user_path(@admin_user)
    assert_difference 'Package.count', -1 do
    delete package_path(@package), params: { package: { member: @nonadmin_user_id}}
    end
    assert_redirected_to @admin_user
  end  
end
