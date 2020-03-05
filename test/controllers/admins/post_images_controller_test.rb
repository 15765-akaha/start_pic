require 'test_helper'

class Admins::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_post_images_index_url
    assert_response :success
  end

end
