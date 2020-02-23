require 'test_helper'

class Users::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_relationships_destroy_url
    assert_response :success
  end

end
