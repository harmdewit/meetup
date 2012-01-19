class User < ActiveRecord::Base
	has_many :participants, :dependent => :destroy

	validates :first_name, :last_name, :ticket, :presence => true
	validates_uniqueness_of :email, :ticket
	# validates_format_of   :email,
	#                         :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
	#                         :message    => 'Email must be valid.'
  
  attr_accessible :email, :first_name, :last_name, :ticket, :uid, :token, :secret, :image, :urls, :description

  def User.generate_ticket
  	ticket = ActiveSupport::SecureRandom.hex(16)
  end
 
end
