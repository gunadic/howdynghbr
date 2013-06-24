class LocationsController < InheritedResources::Base
  respond_to :json

  def index
    @locations = Neighborhood.find(params[:id]).locations
    super
  end

end
