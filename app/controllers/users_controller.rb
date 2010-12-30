class UsersController < ApplicationController
	skip_before_filter :authenticate_user, :only => [:linkedin_authenticate, :linkedin_callback, :confirmation]
	layout 'login'

	# GET /user/:id/linkedin_authenticate 
	def linkedin_authenticate ticket
		user = User.find_by_ticket(ticket)
    unless user.linkedin_id
		  client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")

	    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/users/confirmation/#{user.ticket}/linkedin_callback")  
	    session[:rtoken] = request_token.token
	    session[:rsecret] = request_token.secret
	    redirect_to client.request_token.authorize_url
    else 
    	redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
  	end
  end

  # GET /user/:id/linkedin_callback
  def linkedin_callback
    user = User.find_by_ticket(params[:ticket])
    unless user.linkedin_id
	    client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
	    if params[:oauth_verifier]
	 			pin = params[:oauth_verifier]
		    atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
		    begin
					profile = client.profile(:fields => %w(id,picture_url))
					user.linkedin_id = profile.id
			    user.linkedin_token = atoken
			    user.linkedin_secret = asecret
			    user.picture_url = profile.picture_url

		      if user.save
  		    	session[:linkedin_id] = profile.id
  		   		redirect_to(user, :notice => 'Your account has successfully authenticated with your LinkedIn account.')
  		 		else
  		      format.xml  { render :xml => user.errors, :status => :unprocessable_entity }
  		 		end
				rescue Exception
					@authenticated = false
					flash[:error] = 'Linkedin authentication failed, please authenticate again.'
					redirect_to 'users/confirmation/#{user.ticket}'
		    end
			else
				flash[:notice] = 'Connection failed!'
				redirect_to(:action => 'users/confirmation/#{user.ticket}')
			end
		else
			redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
		end
 	end  

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
  	@linkedin_id = session[:linkedin_id]
		if @user.linkedin_token
	    client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
	    client.authorize_from_access(@user.linkedin_token, @user.linkedin_secret)
	    begin
	    	
	    	@authenticated = true
				@public_linkedin = client.profile(:url => @user.linkedin_url, :fields => %w(public-profile-url,picture_url,first_name,last_name))
			rescue Exception
				flash[:notice] = 'Connection with LinkedIn failed, please authenticate again.'
				@authenticated = false
	    end
	  else
	  	@authenticated = false
		end
  end
  
  # GET /users/confirmation/:ticket
  def confirmation
  	unless session[:linkedin_id]
	  	user = User.find_by_ticket(params[:ticket])
	    if user.linkedin_id
	    	redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
	    else
	    	params[:id] = user.id
				linkedin_authenticate params[:ticket]
	    end
    else
      if User.find_by_linkedin_id(session[:linkedin_id])
    	  redirect_to User.find_by_linkedin_id(session[:linkedin_id]), :notice => 'You are already logged in.'
    	else
    	  session[:linkedin_id] = nil
    	  linkedin_authenticate params[:ticket]
  	  end
  	end
	end

end

