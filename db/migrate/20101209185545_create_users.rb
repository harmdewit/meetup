class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :uid
			t.string :name
      t.string :first_name
			t.string :last_name
      t.string :email
			t.string :nickname
			t.string :location
			t.string :description
			t.string :image
			t.string :phone
			t.string :urls
			t.string :token
			t.string :secret
      t.string :ticket

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
