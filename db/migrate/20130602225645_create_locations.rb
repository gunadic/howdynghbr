class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_address
      t.strin :city
      t.string :state
      t.integer :zip
      t.string :latitude
      t.string :longitude
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
