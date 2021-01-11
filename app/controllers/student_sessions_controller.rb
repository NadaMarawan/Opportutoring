class StudentSessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by_email(params[:email])
    if student && student.authenticate(params[:password_digest])
      session[:student_id] = student.id
      session[:tutor_id] = nil
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
