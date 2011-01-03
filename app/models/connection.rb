class Connection < ActiveRecord::Base
	belongs_to :participant, :foreign_key => 'participant_id'
	
	has_one :connected_participant_connection, :class_name => 'Connection', :foreign_key => 'connected_participant_id', :dependent => :destroy
	belongs_to :connected_participant, :foreign_key => 'participant_id'
	
	validates :participant_id, :connected_participant_id, :presence => true
	validates_uniqueness_of :participant_id, :scope => :connected_participant_id
end
