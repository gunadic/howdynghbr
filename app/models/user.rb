class User < ActiveRecord::Base
  has_many :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  has_one :favorite_category
  attr_accessible :email, :fave_category_id, :first_name, :last_name, :location, 
  :short_bio, :tag_line, :user_name
end
