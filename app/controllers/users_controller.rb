class UsersController < ApplicationController
	before_filter :authenticate_admin!, :only => [:index, :new, :create, :update, :destroy]
	before_filter :authenticate_user, :only => [:show]

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
					profile = client.profile(:fields => %w(id))
					user.linkedin_id = profile.id
			    user.linkedin_token = atoken
			    user.linkedin_secret = asecret	    	
				rescue Exception
					@authenticated = false
					flash[:error] = 'Linkedin authentication failed, please authenticate again.'
					redirect_to 'users/confirmation/#{user.ticket}'
		    end
		    if user.save
		    	session[:linkedin_id] = profile.id
		   		redirect_to(user, :notice => 'Your account has successfully authenticated with your LinkedIn account.')
		 		else
		        format.xml  { render :xml => user.errors, :status => :unprocessable_entity }
		 		end
			else
				flash[:notice] = 'Connection failed!'
				redirect_to(:action => 'users/confirmation/#{user.ticket}')
			end
		else
			redirect_to login_url, :notice => 'You have already linked your account with LinkedIn. Please login as usual.'
		end
 	end  
	
	# GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
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
				#@profile = client.profile(:fields => %w(picture_url))
				#@linkedin_id = client.profile(:fields => %w(id))
				@public_linkedin = client.profile(:id => @user.linkedin_id, :fields => %w(picture_url,first_name,last_name))
		    #@connections = client.connections
			rescue Exception
				flash[:notice] = 'Connection with LinkedIn failed, please authenticate again.'
				@authenticated = false
	    end
	  else
	  	@authenticated = false
		end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
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
    	redirect_to User.find_by_linkedin_id(session[:linkedin_id]), :notice => 'You are already logged in.'
  	end
	end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.ticket = User.generate_ticket

    respond_to do |format|
      if @user.save
				Notifier.registration_request(@user).deliver
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
