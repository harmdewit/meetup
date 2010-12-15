class ApplicationController < ActionController::Base
  protect_from_forgery
	
  protected
  
  def authenticate_user
  	unless @current_user = User.find_by_linkedin_id(session[:linkedin_id])
			redirect_to login_url, :notice => "Please log in"
		end
	end

end
