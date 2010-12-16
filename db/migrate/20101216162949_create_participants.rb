class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :user_id
      t.string :meeting_id
      t.string :motivation

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
