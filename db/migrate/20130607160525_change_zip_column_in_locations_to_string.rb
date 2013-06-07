class ChangeZipColumnInLocationsToString < ActiveRecord::Migration
  def up
    change_column :locations, :zip, :string
  end

  def down
    remove_column :locations, :zip
    add_column :locations, :zip, :integer
  end
end
