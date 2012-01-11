class UsersController < ApplicationController
	skip_before_filter :authenticate_user, :only => [:linkedin_authenticate, :linkedin_callback, :confirmation]
	layout 'login'

	# GET /user/:id/linkedin_authenticate 
	def linkedin_authenticate
		user = User.find_by_ticket(params[:ticket])
    unless user.linkedin_id
      # if Rails.env.production?
  	    request_token = @@client.request_token(:oauth_callback => "http://#{request.host}/users/confirmation/#{user.ticket}/linkedin_callback")  
      # else
        # request_token = @@client.request_token(:oauth_callback => "http://#{request.host_with_port}/users/confirmation/#{user.ticket}/linkedin_callback")  
      # end
	    session[:rtoken] = request_token.token
	    session[:rsecret] = request_token.secret
	    redirect_to @@client.request_token.authorize_url
    else 
    	redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
  	end
  end

  # GET /user/:id/linkedin_callback
  def linkedin_callback
    user = User.find_by_ticket(params[:ticket])
    unless user.linkedin_id
	    if params[:oauth_verifier]
	 			pin = params[:oauth_verifier]
		    atoken, asecret = @@client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
		    begin
					profile = @@client.profile(:fields => %w(id,picture_url))
					user.linkedin_id = profile.id
			    user.linkedin_token = atoken
			    user.linkedin_secret = asecret
			    user.picture_url = profile.picture_url

		      if user.save
  		    	session[:linkedin_id] = profile.id
  		   		redirect_to(last_meeting_url, :notice => 'Your account has successfully authenticated with your LinkedIn account.')
  		 		else
  		      format.xml  { render :xml => user.errors, :status => :unprocessable_entity }
  		 		end
				rescue Exception
					profile = @@client.profile(:fields => %w(id))
					user.linkedin_id = profile.id
			    user.linkedin_token = atoken
			    user.linkedin_secret = asecret
		      if user.save
  		    	session[:linkedin_id] = profile.id
  		   		redirect_to(last_meeting_url, :notice => 'Your account has successfully authenticated with your LinkedIn account.')
  		 		else
  		      format.xml  { render :xml => user.errors, :status => :unprocessable_entity }
  		 		end
		    end
			else
				flash[:notice] = 'Connection with LinkedIn failed!'
				redirect_to(:action => 'users/confirmation/#{user.ticket}')
			end
		else
			redirect_to login_url, :notice => 'You have already authenticated your account with LinkedIn. Please login as usual.'
		end
 	end  

  # GET /users/1
  # GET /users/1.xml
  def show    
    @user = User.find(params[:id])
  	@linkedin_id = session[:linkedin_id]
		if @user.linkedin_token
	    @@client.authorize_from_access(@user.linkedin_token, @user.linkedin_secret)
	    begin
	    	@authenticated = true
				@public_linkedin = @@client.profile(:url => @user.linkedin_url, :fields => %w(public-profile-url,picture_url,first_name,last_name))
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
	  	@user = User.find_by_ticket(params[:ticket])
	    if @user.linkedin_id
				redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
	    end
    else
      if @user = User.find_by_linkedin_id(session[:linkedin_id])
    	  redirect_to User.find_by_linkedin_id(session[:linkedin_id]), :notice => 'You are already logged in.'
    	else
    	  @user = User.find_by_ticket(params[:ticket])
    	  session[:linkedin_id] = nil
  	  end
  	end
	end

end

