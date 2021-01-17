require "test_helper"

class MatchingsControllerTest < ActionDispatch::IntegrationTest
  test "can create a matching" do
    get "/matchings/new"
    assert_response :success

    post "/matchings",
      params: { matching: { student_id: students(:one).id, tutor_id: tutors(:two).id } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
