class Connection < ActiveRecord::Base
	belongs_to :user
	belongs_to :connected_user_id, :class_name => 'User', :foreign_key =>'connected_user_id'
end
