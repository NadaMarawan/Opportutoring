class TutorsController < ApplicationController
  def show
    @tutor = Tutor.find(params[:id])
  end

  def index
    @tutors = Tutor.all
  end

  def mystudents
    @tutor = Tutor.find(params[:id])
  end

  #This action will render app/views/tutors/new.html.erb
  def new
    #initialize but not save an empty tutor; so that the form we renders knows which fields to use and where to submit
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)

    if @tutor.save
      # go to show page for @tutor
      redirect_to action: "show", id: @tutor.id
      # goes to new form
      #redirect_to action: "new"
      #redirect_to tutors_path(@tutor)
      #redirect_to @tutor
      #redirect_to action: "show"
    else
      # can setup an error message here
      render :new
    end
  end

  # helper
  private

  # require a tutor object to be in "params" object (= object that contains all parameters being passed into the request)
  # also requires (only) specified paramaters to exits in "params" object
  # permit some attributes to be used in the returned hash (whitelist)
  # if checks are passed, returns a hash that is used here to create or update a tutor object
  def tutor_params
    params.require(:tutor).permit(:name, :password, :country, :email)
  end
end
