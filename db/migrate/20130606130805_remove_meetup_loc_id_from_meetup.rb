class RemoveMeetupLocIdFromMeetup < ActiveRecord::Migration
  def up 
    remove_column :meetups, :meetup_loc_id
  end

  def down
    add_column :meetups, :meetup_loc_id, :integer
  end
end
