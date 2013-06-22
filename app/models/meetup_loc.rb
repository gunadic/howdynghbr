class MeetupLoc < ActiveRecord::Base

  belongs_to :location
  belongs_to :meetup

  validates_presence_of :meetup
  validates_presence_of :meetup_id
  validates_numericality_of :meetup_id
  validates_presence_of :location
  validates_presence_of :location_id
  validates_numericality_of :location_id

  attr_accessible :location, :meetup

end
