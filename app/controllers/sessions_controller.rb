class SessionsController < ApplicationController
	skip_before_filter :authenticate_user, :except => :destroy
	layout 'login'
	
	def linkedin_authenticate
    # if Rails.env.production?
      request_token = @@client.request_token(:oauth_callback => "http://#{request.host}/sessions/linkedin_callback")  	    
    # else
      # request_token = @@client.request_token(:oauth_callback => "http://#{request.host_with_port}/sessions/linkedin_callback")  
    # end
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    redirect_to @@client.request_token.authorize_url
  end
  
  def linkedin_callback
    if params[:oauth_verifier]
 			pin = params[:oauth_verifier]
	    atoken, asecret = @@client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
	    begin	
				profile = @@client.profile(:fields => %w(id))
	    	linkedin_id = profile.id
			rescue Exception
			  flash[:error] = 'LinkedIn authenticatie is mislukt, probeer het opnieuw.'
				redirect_to login_url
	    end
	    
	    if user = User.find_by_linkedin_id(linkedin_id)
			  session[:linkedin_id] = linkedin_id
			  redirect_to last_meeting_url, :notice => 'Logged in.'
			else
			  flash[:error] = "Je LinkedIn account is niet bekend bij ons."
			  redirect_to login_url
		  end
		else
		  flash[:error] = 'Connectie maken met LinkedIn is mislukt.'
			redirect_to login_url
		end
 	end
 	
 	def destroy
 	  session[:linkedin_id] = nil
 	  redirect_to login_url, :notice => "Logged out."
 	end
end