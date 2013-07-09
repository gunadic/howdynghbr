class Participation < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  has_one :review
  
  attr_accessible :meetup_id, :meetup, :user_id, :user

  validates_uniqueness_of :user_id, :scope => :meetup_id
  validates_presence_of :user_id
  validates_presence_of :meetup_id

  def user_name
  	user.user_name
  end

end
