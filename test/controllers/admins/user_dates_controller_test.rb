require 'test_helper'

class Admins::UserDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_user_dates_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_user_dates_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_user_dates_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_user_dates_update_url
    assert_response :success
  end

end
