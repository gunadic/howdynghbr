class AddNeighborhoodIDtoMeetup < ActiveRecord::Migration
  def up
    add_column :meetups, :neighborhood_id, :integer
  end

  def down
    remove_column :meetups, :neighborhood_id
  end
end
