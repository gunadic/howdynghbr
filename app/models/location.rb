class Location < ActiveRecord::Base

  belongs_to :neighborhood
  has_many :meetup_locs
  has_many :meetups, :through => :meetup_locs

  attr_accessible :city, :latitude, :longitude, :name, :neighborhood_id, 
    :state, :street_address, :zip

  geocoded_by :full_address
  after_validation :geocode
  def full_address
    [name, street_address, city, state, zip].join(" ")
  end
  @temp = :full_address
  validates_uniqueness_of @temp

end
