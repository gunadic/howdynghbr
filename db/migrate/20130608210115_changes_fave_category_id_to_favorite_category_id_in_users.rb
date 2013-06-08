class ChangesFaveCategoryIdToFavoriteCategoryIdInUsers < ActiveRecord::Migration
  def up
    rename_column :users, :fave_category_id, :favorite_category_id
  end

  def down
    rename_column :users, :favorite_category_id, :fave_category_id

  end
end
