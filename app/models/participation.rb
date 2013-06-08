class Participation < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  has_one :review
  
  attr_accessible :meetup_id, :user_id

  validates_presence_of :user_id
  validates_presence_of :meetup_id

end
