require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get comfirm" do
    get loans_comfirm_url
    assert_response :success
  end

  test "should get complete" do
    get loans_complete_url
    assert_response :success
  end

end
