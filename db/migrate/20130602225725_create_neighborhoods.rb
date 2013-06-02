class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :coordinates

      t.timestamps
    end
  end
end
