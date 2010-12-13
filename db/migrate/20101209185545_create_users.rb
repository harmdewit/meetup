class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :linkedin_id
      t.string :linkedin_token
      t.string :linkedin_secret
      t.string :ticket

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
