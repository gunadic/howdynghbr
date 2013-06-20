class ChangeMeetUpTimeColumnInMeetups < ActiveRecord::Migration
  def up
    remove_column :meetups, :meet_up_time
    add_column :meetups, :meetup_date, :date
    add_column :meetups, :meetup_time, :time
  end

  def down
    remove_column :meetups, :meetup_date
    remove_column :meetups, :meetup_time
    add_column :meetups, :meet_up_time, :datetime
  end
end
