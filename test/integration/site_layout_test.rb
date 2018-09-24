require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", aerial_path
    assert_select "a[href=?]", ashtanga_path
  end
  
end
