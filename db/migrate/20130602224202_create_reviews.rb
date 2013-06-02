class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :participation_id
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
