class Location < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :name, :neighborhood_id, :state, :street_address, :zip
end
