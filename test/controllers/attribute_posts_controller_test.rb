require 'test_helper'

class AttributePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get attribute_posts_post_url
    assert_response :success
  end

end
