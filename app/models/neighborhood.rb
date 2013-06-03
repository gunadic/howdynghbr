class Neighborhood < ActiveRecord::Base

  has_many :locations

  attr_accessible :city, :coordinates, :name, :state
end
