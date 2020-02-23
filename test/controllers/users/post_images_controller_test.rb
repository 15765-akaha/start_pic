require 'test_helper'

class Users::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_post_images_index_url
    assert_response :success
  end

  test "should get show" do
    get users_post_images_show_url
    assert_response :success
  end

  test "should get new" do
    get users_post_images_new_url
    assert_response :success
  end

  test "should get create" do
    get users_post_images_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_post_images_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_post_images_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_post_images_destroy_url
    assert_response :success
  end

  test "should get search" do
    get users_post_images_search_url
    assert_response :success
  end

end
