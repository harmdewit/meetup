class Connection < ActiveRecord::Base
	belongs_to :participant, :foreign_key => 'connected_participant_id'

	validates :participant_id, :connected_participant_id, :presence => true
	validates_uniqueness_of :participant_id, :scope => :connected_participant_id
end
