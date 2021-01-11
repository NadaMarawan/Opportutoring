class TutorSessionsController < ApplicationController
  def new
  end

  def create
    tutor = Tutor.find_by_email(params[:email])
    if tutor && tutor.authenticate(params[:password_digest])
      session[:tutor_id] = tutor.id
      session[:student_id] = nil
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:tutor_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
