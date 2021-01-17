require "test_helper"

class TutorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "can login tutor" do
    get "/tutors/login"
    assert_response :success

    post "/tutors/login",
      params: { email: tutors(:one).email, password_digest: "pppppppp" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
