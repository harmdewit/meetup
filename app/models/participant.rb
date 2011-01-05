class Participant < ActiveRecord::Base
	belongs_to :meeting
	belongs_to :user
	has_many :connections, :dependent => :destroy
	has_many :connected_participants, :class_name => "Connection", :foreign_key => 'connected_participant_id', :dependent => :destroy
	validate :user_id, :meeting_id, :presence => true
	validates_uniqueness_of :user_id, :scope => :meeting_id
end
