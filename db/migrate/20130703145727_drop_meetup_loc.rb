class DropMeetupLoc < ActiveRecord::Migration
  def change
    drop_table :meetup_locs
  end

end
