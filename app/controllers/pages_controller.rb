class PagesController < ApplicationController
  def index
    @hoods = Neighborhood.all.collect{|n| [n.name,n.name]}.unshift(["Select a neighborhood", nil])
    @search = Meetup.search(params[:q])
  end


end
