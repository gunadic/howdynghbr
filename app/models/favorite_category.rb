class FavoriteCategory < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  attr_accessible :category_id, :user_id
end
