class Admin < ActiveRecord::Base
	# Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
end
