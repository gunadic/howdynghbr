class MeetupsController < ApplicationController
  before_filter :authenticate_user!


  def index
    @meetups = Meetup.find(:all)
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(params[:meetup])
    @meetup.user = current_user
    if @meetup.save
      flash[:notice] = "Meetup succesfully created!"
      redirect_to meetup_path(@meetup)
    else
      flash[:notice] = "Something went wrong!"
      redirect_to new_meetup_path(@meetup)
    end
  end



end
