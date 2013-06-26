class ParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @participation = @meetup.participations.build
    @participation.user = current_user
    if @participation.save
      flash[:notice] = "Cool! See you there!"
      redirect_to meetup_path(@meetup)
    else
      flash[:notice] = "Hold your horses, somethings sideways..."
      redirect_to movie_path(@meetup)
    end
  end

  def destroy
    
  end


end
