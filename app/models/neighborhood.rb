class Neighborhood < ActiveRecord::Base

  has_many :locations
  has_many :meetups, :inverse_of => :neighborhood
  attr_accessible :city, :coordinates, :name, :state

  validates_presence_of :state
  validates_presence_of :name
  validates_presence_of :city

  validates_uniqueness_of :name, :scope => [:city, :state]

end
