class AddLinkeninUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :linkedin_url, :string
  end

  def self.down
    remove_column :users, :linkedin_url
  end
end
