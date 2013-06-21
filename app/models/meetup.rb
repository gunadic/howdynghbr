class Meetup < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, inverse_of: :meetups
  belongs_to :neighborhood, :inverse_of => :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  belongs_to :location, inverse_of: :meetups
    # has_one :meetup_loc
    # has_one :location, :through => :meetup_loc

  attr_accessible :category_id, :description, :is_past, :meet_up_time, :user_id, 
    :meetup_date, :meetup_time, :neighborhood_id, :location_id

  validates_presence_of :user


end
