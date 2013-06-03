class Category < ActiveRecord::Base

  has_many :favorite_categories
  has_many :meetups

  attr_accessible :name, :parent_id
end
