require "test_helper"

class CompanyHeadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_heads_index_url
    assert_response :success
  end

  test "should get approve" do
    get company_heads_approve_url
    assert_response :success
  end

  test "should get destroy" do
    get company_heads_destroy_url
    assert_response :success
  end
end
