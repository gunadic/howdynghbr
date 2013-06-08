class Review < ActiveRecord::Base

  belongs_to :participation

  attr_accessible :participation_id, :rating, :review

  validates_presence_of :rating
  validates_numericality_of :rating
  validates_presence_of :review
  validates_length_of :review, :minimum => 25, :maximum => 1000, :allow_blank => true

end
