class Connection < ActiveRecord::Base
	belongs_to :participant, :foreign_key => 'connected_participant_id'
	#belongs_to :connected_user, :class_name => 'User', :foreign_key => 'user_id'
end
