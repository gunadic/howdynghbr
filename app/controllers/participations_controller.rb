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
      flash[:alert] = "Hold your horses, something's gone sideways..."
      redirect_to meetup_path(@meetup)
    end
  end

  def destroy
    # Something smells here.
    # This is referred to in _sign_up_cancel.html.erb
    # But somehow, the values for :meetup_id and :id are being mixed up
    # This hacktastic way works for now... but I dont like it.
    @participation = Participation.find(params[:id])
    if @participation.destroy
      flash[:notice] = "You are no longer attending this meetup."
      redirect_to meetup_path(params[:meetup_id])
    else
      flash[:alert] = "Something went wrong."
    end
  end


end
