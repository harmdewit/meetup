class Meeting < ActiveRecord::Base
	has_many :participants,  :dependent => :destroy

	validates :title, :description, :presence => true
	validates_uniqueness_of :title
end
