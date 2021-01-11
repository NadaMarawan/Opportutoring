class MatchingsController < ApplicationController
  def show
    @matching = Matching.find(params[:id])
  end

  def index
    if @current_student 
      @matchings = @current_student.matchings
    else if @current_tutor
      @matchings = @current_tutor.matchings
    end
  end

  def new
    #initialize but not save an empty matching; so that the form we renders knows which fields to use and where to submit
    @matching = Matching.new
    @students = Student.all
    @tutors = Tutor.all
  end

  def create
    @matching = Matching.new(matching_params)

    if @matching.save
      # go to show page for @matching
      redirect_to action: "show", id: @matching.id
      # goes to new form
      #redirect_to action: "new"
      #redirect_to matchings_path(@matching)
      #redirect_to @matching
      #redirect_to action: "show"
    else
      # can setup an error message here
      # render :new
    end
  end

  # helper
  private

  # require a matching object to be in "params" object (= object that contains all parameters being passed into the request)
  # also requires (only) specified paramaters to exits in "params" object
  # permit some attributes to be used in the returned hash (whitelist)
  # if checks are passed, returns a hash that is used here to create or update a matching object
  def matching_params
    params.require(:matching).permit(:tutor_id, :student_id)
  end
end
