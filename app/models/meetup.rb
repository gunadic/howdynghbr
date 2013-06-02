class Meetup < ActiveRecord::Base
  attr_accessible :category_id, :description, :is_past, :meet_up_time, :meetup_loc_id, :user_id
end
