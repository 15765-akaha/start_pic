require 'test_helper'

class Admins::ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_themes_index_url
    assert_response :success
  end

  test "should get create" do
    get admins_themes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_themes_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get admins_themes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_themes_update_url
    assert_response :success
  end

end
