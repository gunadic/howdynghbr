class DropMeetupLoc < ActiveRecord::Migration
  def up
    drop_table :meetup_locs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
