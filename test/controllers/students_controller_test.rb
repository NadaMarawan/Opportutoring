require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  
  test "can create a student" do
    get "/students/new"
    assert_response :success

    post "/students",
      params: { student: { name: "Nada", email: "nada@mail.mcgill.ca", country: "Canada", password: "pppppppp", level: "beginner"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success

  end
end
