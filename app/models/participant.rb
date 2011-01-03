class Participant < ActiveRecord::Base
	belongs_to :meeting
	belongs_to :user
	has_many :connections, :dependent => :destroy

	validate :user_id, :meeting_id, :presence => true
	validates_uniqueness_of :user_id, :scope => :meeting_id
end
