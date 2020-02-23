require 'test_helper'

class Users::ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_themes_index_url
    assert_response :success
  end

  test "should get show" do
    get users_themes_show_url
    assert_response :success
  end

  test "should get search" do
    get users_themes_search_url
    assert_response :success
  end

end
