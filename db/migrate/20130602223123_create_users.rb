class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :tag_line
      t.text :short_bio
      t.text :location
      t.integer :fave_category_id

      t.timestamps
    end
  end
end
