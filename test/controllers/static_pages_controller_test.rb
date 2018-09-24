require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "SpaceOnrails"
  end
  
  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get aerial" do
    get aerial_path
    assert_response :success
    assert_select "title", "Aerial Silk & Hoop | #{@base_title}"
  end

end
