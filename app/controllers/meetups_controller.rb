class MeetupsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @q = Meetup.search(params[:q])
    @meetups = @q.result(:distinct => true)
    @markers = ""
    @meetups.each do |meetup| 
      @markers += meetup.location.to_gmaps4rails
    end
    swap_brackets(@markers)
  end

  def show
    @meetup = Meetup.find(params[:id])
    @participation = @meetup.participations.new
    @location = @meetup.location
    @json = @location.to_gmaps4rails
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

  protected

  def swap_brackets(string)
      string.gsub!(/\]\[/,",")
  end

end
