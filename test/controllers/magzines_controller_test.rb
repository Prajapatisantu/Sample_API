require "test_helper"

class MagzinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get magzines_index_url
    assert_response :success
  end

  test "should get create" do
    get magzines_create_url
    assert_response :success
  end

  test "should get new" do
    get magzines_new_url
    assert_response :success
  end

  test "should get show" do
    get magzines_show_url
    assert_response :success
  end
end
