class Meeting < ActiveRecord::Base
	has_many :participants, :dependent => :destroy
	has_many :users, :through => :participants
	
	validates :title, :description, :presence => true
end
