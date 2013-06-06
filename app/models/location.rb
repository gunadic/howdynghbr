class Location < ActiveRecord::Base

  belongs_to :neighborhood
  has_many :meetup_locs
  has_many :meetups, :through => :meetup_locs

  attr_accessible :city, :latitude, :longitude, :name, :neighborhood_id, :state, :street_address, :zip
end
