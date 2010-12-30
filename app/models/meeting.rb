class Meeting < ActiveRecord::Base
	has_many :participants,  :dependent => :destroy
	has_many :participating_users, :through => :participants
	
	validates :title, :description, :presence => true
end
