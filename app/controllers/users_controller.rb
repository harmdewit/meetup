class UsersController < ApplicationController
	skip_before_filter :authenticate_user, only: [:new, :create]
	layout 'login'
	
	def show    
		@user = User.find(params[:id])
	end
	
	# GET /users/new/:ticket
	def new
		unless session[:id]
			@user = User.find_by_ticket(params[:ticket])
			if @user.uid.blank?
				session[:ticket] = params[:ticket]
			else
				redirect_to login_path, :notice => 'You have already registered with MeetUp. Please login as usual.'
			end
		else
			redirect_to root_path, :notice => 'You are already logged in.'
		end
	end
	
	def create
		if u = User.find_by_ticket(session[:ticket])
			omniauth = session[:omniauth]

			u.uid = omniauth['uid']
			ui = omniauth['info']
			u.name = ui['name']
			u.email = ui['email']
			u.nickname = ui['nickname']
			u.location = ui['location']
			u.description = ui['description']
			u.image = ui['image']
			u.phone = ui['phone']
			u.urls = ui['urls']
			u.token = omniauth['credentials']['token']
			u.secret = omniauth['credentials']['secret']
			
			u.save!
			session[:ticket] = nil
			session[:omniauth] = nil
			
			session[:id] = u.id
			redirect_to root_path
		else
			session[:ticket] = nil
			session[:omniauth] = nil
			redirect_to login_path, notice: "The ticket provided by mail was incorrect. Please ask the admin for a new ticket."
		end
	end

end

