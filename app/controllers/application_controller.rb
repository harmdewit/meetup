class ApplicationController < ActionController::Base
  protect_from_forgery
	
  protected
  
  def authenticate_user
  	unless session[:current_user]
			if session[:linkedin_id]
				redirect_to login_url, :method => 'POST'
			else
  			redirect_to login_url, :notice => "Please log in"
			end
		end
	end

end
