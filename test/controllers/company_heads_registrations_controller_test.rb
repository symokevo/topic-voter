require "test_helper"

class CompanyHeadsRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_heads_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get company_heads_registrations_create_url
    assert_response :success
  end
end
