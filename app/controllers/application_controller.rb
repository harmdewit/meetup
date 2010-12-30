class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user
  
  @@client = LinkedIn::Client.new("DiHSTa57ykwC7ARPdI6jsp1RfB1zw333VR0maZAMvy0GSq2B0kiYi3NEYJOSeL35", "h2gCOJbYQNQUWxl2YfJuehRxEO9nc-J48RkOi01qboGMZV5qzF5ONf1SL84wDF86")
	
  protected
  
  def authenticate_user
  	unless devise_controller?  	  
	  	if (@current_user = User.find_by_linkedin_id(session[:linkedin_id])) && session[:linkedin_id]
		    @@client.authorize_from_access(@current_user.linkedin_token, @current_user.linkedin_secret)
	  	else
				redirect_to login_url, :notice => "Please log in"
			end
		end
	end

end
