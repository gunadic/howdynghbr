class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :user_id
      t.integer :category_id
      t.datetime :meet_up_time
      t.boolean :is_past
      t.integer :meetup_loc_id
      t.text :description

      t.timestamps
    end
  end
end
