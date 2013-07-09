class User < ActiveRecord::Base

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


  def past_attended
    past_attended = []
    self.participations.each do |p|
      if p.meetup.past?
        past_attended << p.meetup
      end
    end
    past_attended
  end

end
