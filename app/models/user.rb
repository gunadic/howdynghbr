class User < ActiveRecord::Base
  has_many :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  has_one :favorite_category
  
  attr_accessible :email, :fave_category_id, :first_name, :last_name, :location, 
  :short_bio, :tag_line, :user_name, :id

  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

end
