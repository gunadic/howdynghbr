class Participation < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  has_one :review
  
  attr_accessible :meetup_id, :user_id
end
