class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.string :user_id
      t.string :connected_user_id
      t.string :meeting_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
