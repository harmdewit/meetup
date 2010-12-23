class ChangeUserIdAndRequestedUserIdColumnsAtConnections < ActiveRecord::Migration
  def self.up
  	rename_column :connections, :user_id, :participant_id
  	rename_column :connections, :connected_user_id, :connected_participant_id 
  end

  def self.down
  	rename_column :connections, :participant_id, :user_id
  	rename_column :connections, :connected_participant_id, :connected_user_id
  end
end
