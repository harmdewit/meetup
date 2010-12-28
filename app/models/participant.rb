class Participant < ActiveRecord::Base
	belongs_to :meeting
	belongs_to :user
	belongs_to :participating_user, :class_name => 'User', :foreign_key =>'user_id'
 	has_many :connections
end
