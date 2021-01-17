require "test_helper"

class TutorsControllerTest < ActionDispatch::IntegrationTest
  test "can create a tutor" do
    get "/tutors/new"
    assert_response :success

    post "/tutors",
      params: { tutor: { name: "Afreen", email: "afreen@mail.mcgill.ca", country: "India", password: "pppppppp" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
