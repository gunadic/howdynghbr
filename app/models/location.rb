class Location < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :neighborhood, inverse_of: :locations
  has_many :meetups, inverse_of: :location
  acts_as_gmappable :process_geocoding => false

  attr_accessible :city, :latitude, :longitude, :name, :neighborhood_id, 
    :state, :street_address, :zip

  geocoded_by :full_address
  before_save :geocode
  def full_address
    [street_address, city, state, zip].join(" ")
  end

  def gmaps4rails_address
    [full_address, "USA"].join(" ")
  end

  validates_uniqueness_of :street_address, :scope => [:city, :state, :zip]
  validates_presence_of :city
  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :street_address
  validates_presence_of :zip

  validates_length_of :zip, :minimum => 5, :maximum => 10
  validates_length_of :state, :minimum => 2, :maximum => 2



  def gmaps4rails_infowindow
    result = "<ul>"
    meetups.each do |meetup|
      result += "<li><a href=#{meetup_path(meetup)}><h4>#{meetup.in_words}</h4></a></li>"

    end
    result += "</ul>"
    return result
  end


end
