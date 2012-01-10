class Connection < ActiveRecord::Base
	belongs_to :participant, :foreign_key => 'participant_id'
	belongs_to :connected_participant, :class_name => 'Participant'
	
	validates :participant_id, :connected_participant_id, :presence => true
	validates_uniqueness_of :participant_id, :scope => :connected_participant_id
end
