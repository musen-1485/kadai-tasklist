require "test_helper"

class CreatetasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get createtasks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get createtasks_destroy_url
    assert_response :success
  end
end
