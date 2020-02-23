require 'test_helper'

class Users::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_likes_destroy_url
    assert_response :success
  end

end
