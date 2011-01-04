class Connection < ActiveRecord::Base
	belongs_to :participant
	belongs_to :connected_participant, :class_name => "Participant"
	
	#has_one :connected_participant_connection, :class_name => 'Connection', :foreign_key => 'connected_participant_id', :dependent => :destroy
	
	validates :participant_id, :connected_participant_id, :presence => true
	validates_uniqueness_of :participant_id, :scope => :connected_participant_id
end
