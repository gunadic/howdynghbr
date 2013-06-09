class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  has_one :favorite_category
  has_one :category, :through => :favorite_category
  
  attr_accessible :email, :first_name, :last_name, :location, 
    :short_bio, :tag_line, :user_name, :id, :password, 
    :password_confirmation, :remember_me

  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

end
