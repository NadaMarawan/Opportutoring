class ApplicationController < ActionController::Base
  before_action :current_student
  before_action :current_tutor
  helper_method :current_student
  helper_method :current_tutor

  def current_student
    if session[:student_id]
      @current_student = Student.find(session[:student_id])
    else
      @current_student = nil
    end
  end

  def current_tutor
    if session[:tutor_id]
      @current_tutor = Tutor.find(session[:tutor_id])
    else
      @current_tutor = nil
    end
  end
end
