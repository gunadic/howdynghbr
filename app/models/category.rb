class Category < ActiveRecord::Base

  has_many :favorite_categories
  has_many :users, :through => :favorite_categories
  has_many :meetups, inverse_of: :category

  attr_accessible :name, :parent_id

  validates_presence_of :name
  validates_uniqueness_of :name

end
