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

  validates_uniqueness_of :street_address, :scope => [:city, :state, :zip]
  validates_presence_of :city
  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :street_address
  validates_presence_of :zip

  validates_length_of :zip, :minimum => 5, :maximum => 10
  validates_length_of :state, :minimum => 2, :maximum => 2

end
