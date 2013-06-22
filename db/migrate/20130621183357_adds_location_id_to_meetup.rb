class AddsLocationIdToMeetup < ActiveRecord::Migration
  def up
    add_column :meetups, :location_id, :integer
  end

  def down
    remove_column :meetups, :location_id
  end
end
