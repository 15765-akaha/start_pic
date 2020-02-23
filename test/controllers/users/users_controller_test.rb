require 'test_helper'

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_users_update_url
    assert_response :success
  end

  test "should get withdrow" do
    get users_users_withdrow_url
    assert_response :success
  end

  test "should get switch" do
    get users_users_switch_url
    assert_response :success
  end

  test "should get follows" do
    get users_users_follows_url
    assert_response :success
  end

  test "should get followers" do
    get users_users_followers_url
    assert_response :success
  end

  test "should get likes" do
    get users_users_likes_url
    assert_response :success
  end

end
