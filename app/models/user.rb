class User < ActiveRecord::Base
  attr_accessible :email, :fave_category_id, :first_name, :last_name, :location, :short_bio, :tag_line, :user_name
end
