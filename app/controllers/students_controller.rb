class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def mytutors
    @student = Student.find(params[:id])
    #@mytutors = .tutors
  end

  #This action will render app/views/students/new.html.erb
  def new
    #initialize but not save an empty student; so that the form we renders knows which fields to use and where to submit
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      # go to show page for @student
      redirect_to action: "show", id: @student.id
      # goes to new form
      #redirect_to action: "new"
      #redirect_to students_path(@student)
      #redirect_to @student
      #redirect_to action: "show"
    else
      # can setup an error message here
      render :new
    end
  end

  # helper
  private

  # require a student object to be in "params" object (= object that contains all parameters being passed into the request)
  # also requires (only) specified paramaters to exits in "params" object
  # permit some attributes to be used in the returned hash (whitelist)
  # if checks are passed, returns a hash that is used here to create or update a student object
  def student_params
    params.require(:student).permit(:name, :password, :country, :level, :email)
  end
end
