class PagesController < ApplicationController
  def index
    @search = Meetup.search(params[:q])
  end


end
