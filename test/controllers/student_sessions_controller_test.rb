require "test_helper"

class StudentSessionsControllerTest < ActionDispatch::IntegrationTest
  test "can login student" do
    get "/students/login"
    assert_response :success

    post "/students/login",
      params: { email: students(:one).email, password_digest: "pppppppp" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
