class Meetup < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :participations
  has_one :meetup_loc


  attr_accessible :category_id, :description, :is_past, :meet_up_time, :meetup_loc_id, :user_id
end
