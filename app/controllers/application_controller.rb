class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user
  # if Rails.env.production?
    @@client = LinkedIn::Client.new("du6egpmuzdvl", "FoePCrBCPDs2qDGE")
  # else
    # @@client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
  # end
  protected
  
  def authenticate_user
  	unless devise_controller?  	  
	  	if (@current_user = User.find_by_linkedin_id(session[:linkedin_id])) && session[:linkedin_id]
		    @@client.authorize_from_access(@current_user.linkedin_token, @current_user.linkedin_secret)
	  	else
				redirect_to login_url, :notice => "Please log in."
			end
		end
	end

end

