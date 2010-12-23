class Connection < ActiveRecord::Base
	belongs_to :user
	belongs_to :connected_user, :class_name => 'User', :foreign_key =>'connected_user_id'
end
