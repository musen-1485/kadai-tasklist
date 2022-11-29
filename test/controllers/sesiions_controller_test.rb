require "test_helper"

class SesiionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sesiions_new_url
    assert_response :success
  end

  test "should get create" do
    get sesiions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sesiions_destroy_url
    assert_response :success
  end
end
