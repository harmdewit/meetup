class Participant < ActiveRecord::Base
	belongs_to :meeting
	belongs_to :user
	has_many :connections
 	has_many :users, :through => :connections
end
