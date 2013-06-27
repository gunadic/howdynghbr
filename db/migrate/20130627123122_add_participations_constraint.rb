class AddParticipationsConstraint < ActiveRecord::Migration
  def change
    add_index :participations, [:user_id, :meetup_id], unique: true
  end
end
