class Review < ActiveRecord::Base

  belongs_to :participation

  attr_accessible :participation_id, :rating, :review
end
