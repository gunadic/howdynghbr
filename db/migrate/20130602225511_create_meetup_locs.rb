class CreateMeetupLocs < ActiveRecord::Migration
  def change
    create_table :meetup_locs do |t|
      t.string :location_id
      t.string :meetup_id

      t.timestamps
    end
  end
end
