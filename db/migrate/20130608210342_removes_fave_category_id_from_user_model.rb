class RemovesFaveCategoryIdFromUserModel < ActiveRecord::Migration
  def up
    remove_column :users, :favorite_category_id
  end

  def down
    add_column :users, :favorite_category_id, :integer
  end
end
