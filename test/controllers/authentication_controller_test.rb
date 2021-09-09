require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get authenticate" do
    get authentication_authenticate_url
    assert_response :success
  end
end
