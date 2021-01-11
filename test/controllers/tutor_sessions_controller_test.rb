require "test_helper"

class TutorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tutor_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get tutor_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tutor_sessions_destroy_url
    assert_response :success
  end
end
