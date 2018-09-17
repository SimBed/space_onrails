require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get home_url
    assert_response :success
  end

  test "should get aerial" do
    get aerial_url
    assert_response :success
  end
end