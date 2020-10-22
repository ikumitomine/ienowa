require 'test_helper'

class AttributeBankPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get comfirm" do
    get attribute_bank_posts_comfirm_url
    assert_response :success
  end

  test "should get complete" do
    get attribute_bank_posts_complete_url
    assert_response :success
  end

end
