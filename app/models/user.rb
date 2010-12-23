class User < ActiveRecord::Base
	has_many :participants, :dependent => :destroy
	has_many :connections, :dependent => :destroy
	
	attr_accessible :email, :first_name, :last_name, :ticket
	validates :first_name, :last_name, :email, :ticket, :presence => true
	validates_uniqueness_of :email, :ticket
	validates_format_of   :email,
                        :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message    => 'email must be valid'

  def User.generate_ticket
  	ticket = ActiveSupport::SecureRandom.hex(16)
  end
 
end
