class MeetupLoc < ActiveRecord::Base

  belongs_to :location
  belongs_to :meetup

  attr_accessible :location_id, :meetup_id

  validates_presence_of :meetup_id
  validates_numericality_of :meetup_id
  validates_presence_of :location_id
  validates_numericality_of :location_id
end
