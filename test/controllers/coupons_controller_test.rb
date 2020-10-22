require 'test_helper'

class CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get target" do
    get coupons_target_url
    assert_response :success
  end

end
