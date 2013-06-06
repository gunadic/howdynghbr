class ChangeMeetupLocIDsToStrings < ActiveRecord::Migration
  def up
    remove_column :meetup_locs, :location_id
    add_column :meetup_locs, :location_id, :integer
    remove_column :meetup_locs, :meetup_id
    add_column :meetup_locs, :meetup_id, :integer
  end

  def down
    remove_column :meetup_locs, :location_id
    add_column :meetup_locs, :location_id, :string
    remove_column :meetup_locs, :meetup_id
    add_column :meetup_locs, :meetup_id, :string
  end
end
