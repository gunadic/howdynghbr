class Meetup < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, inverse_of: :meetups
  belongs_to :neighborhood, :inverse_of => :meetups
  has_many :participations
  has_many :reviews, :through => :participations
  belongs_to :location, inverse_of: :meetups
  acts_as_gmappable :process_geocoding => false

  attr_accessible :category_id, :description, :is_past, :meet_up_time, :user_id,
    :meetup_date, :meetup_time, :neighborhood_id, :neighborhood, :location_id

  validates_presence_of :user
  validates_presence_of :category
  validates_presence_of :neighborhood
  validates_presence_of :location
  validates_presence_of :meetup_time
  validates_presence_of :meetup_date

  def time
    meetup_time.strftime("%I:%M %p")
  end

  def date
    meetup_date.strftime("%D")
  end

  def hood
    neighborhood.name
  end

  def username
    user.user_name
  end

  def cat_name
    category.name
  end

  def in_words
    "#{user.user_name} wants to #{category.name}
      at #{location.name} in #{neighborhood.name} on #{meetup_date.strftime("%m/%d")}
      around #{meetup_time.strftime("%I:%M%p")}."
  end

  def user_signed_up?(user)
    participations.where(user_id: user).present?
  end

  def past?
    self.meetup_date.past?
  end

  def participation_for(user)
    participations.where(user_id: user).first
  end

  def gmaps4rails_address
    "#{location.street_address}, #{location.city}, #{location.state}, #{self.location.latitude}, #{self.location.longitude}"
  end


end
