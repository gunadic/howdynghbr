class MeetupLoc < ActiveRecord::Base

  belongs_to :location
  belongs_to :meetup

  attr_accessible :location_id, :meetup_id
end
