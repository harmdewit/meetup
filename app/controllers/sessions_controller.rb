class SessionsController < ApplicationController
	skip_before_filter :authenticate_user, :except => :destroy
	layout 'login'
	
	def new
	end
	
	def create
		omniauth = request.env["omniauth.auth"]
		unless session[:ticket]
			if User.find_by_uid(omniauth['uid'])
				session[:id] = User.find_by_uid(omniauth['uid']).id
				redirect_to last_meeting_path
			else
				redirect_to login_path, notice: "Your LinkedIn account is not known by our service. Please register by following the instructions on the mail provided by us."
			end
		else
			session[:omniauth] = omniauth
			redirect_to create_user_path
		end
	end
	
	def destroy
		session[:uid] = nil
		redirect_to login_path, :notice => "Logged out."
	end
end