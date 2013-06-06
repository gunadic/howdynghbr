class ChangeLatitudeAndLongitudeFormatInLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :latitude
    remove_column :locations, :longitude
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end

  def down
    change_column :locations, :latitude, :string
    change_column :locations, :longitude, :string
  end
end
