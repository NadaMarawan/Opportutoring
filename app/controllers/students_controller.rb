class StudentsController < ApplicationController
  def show
    # disallow a student to view a non-existing student's profile
    begin
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      return
    end
  end

  def index
    @students = Student.all
  end

  def mytutors
    @student = Student.find(params[:id])
  end

  #This action will render app/views/students/new.html.erb
  def new
    #initialize but not save an empty student; so that the form we renders knows which fields to use and where to submit
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      session[:student_id] = @student.id
      session[:tutor_id] = nil
      redirect_to root_url, notice: "Logged in!"
    else
      # can setup an error message here
      render :new
    end
  end

  #This action will render app/views/students/edit.html.erb
  def edit
    # disallow a student to edit a non-existing student's profile
    begin
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      return
    end

    # disallow a student to edit another student's profile
    if session[:student_id] != @student.id
      redirect_to root_url
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to action: "show", id: @student.id
    else
      # can setup an error message here
      render :edit
    end
  end 

  # helper
  private

  # require a student object to be in "params" object (= object that contains all parameters being passed into the request)
  # also requires (only) specified paramaters to exits in "params" object
  # permit some attributes to be used in the returned hash (whitelist), (but not need to have them)
  # if checks are passed, returns a hash that is used here to create or update a student object
  def student_params
    params.require(:student).permit(:name, :password, :password_confirmation, :country, :level, :email, :image).compact_blank
  end
end
