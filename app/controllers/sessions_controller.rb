class SessionsController < ApplicationController
	skip_before_filter :authenticate_user, :except => :destroy
	layout 'login'
	
	def linkedin_authenticate
	  client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/sessions/linkedin_callback")  
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    redirect_to client.request_token.authorize_url
  end
  
  def linkedin_callback
    client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
    if params[:oauth_verifier]
 			pin = params[:oauth_verifier]
	    atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
	    begin	
				profile = client.profile(:fields => %w(id))
	    	linkedin_id = profile.id
			rescue Exception
				redirect_to login_url, :notice => 'Linkedin authentication failed, please authenticate again.'
	    end
	    
			session[:linkedin_id] = linkedin_id
			create
		else
			redirect_to login_url, :notice => 'Connection failed!'
		end
 	end  
  
  def create
    if user = User.find_by_linkedin_id(session[:linkedin_id])
      redirect_to user, :notice => 'Succesfully logged in.'
    else
      redirect_to login_url, :notice => "Your LinkedIn account is not known in our database, please use your LinkedIn account you used when you first visited this website."
    end
  end

  def destroy
    session[:linkedin_id] = nil
    redirect_to '/login', :notice => "Logged out"
  end

end
