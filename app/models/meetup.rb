class Meetup < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :neighborhood, :inverse_of => :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  has_one :meetup_loc
  has_one :location, :through => :meetup_loc

  attr_accessible :category_id, :description, :is_past, :meet_up_time, :user_id

  validates_presence_of :user


end
