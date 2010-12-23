class Meeting < ActiveRecord::Base
	has_many :participants,  :dependent => :destroy
	has_many :participating_users, :through => :participants
	#has_many :connections, :dependent => :destroy
	
	validates :title, :description, :presence => true
end
