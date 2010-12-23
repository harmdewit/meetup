class MeetingsController < ApplicationController
  
  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @meeting = Meeting.find(params[:id])
		
  end
  
  def show_participants
  	@meeting = Meeting.find(params[:id])
  	#@participants = Participant.find_all_by_meeting_id(params[:id])
		#@users = User.find_all
=begin
		@participants.each do |p|
  		@user_card = User.find(p.user_id)
  		if @user.linkedin_token
	    client = LinkedIn::Client.new("TMERi4FIyPAGjBhjwBtpd6wT-dBuVYU3fBbbtTuzXGlYgTlDHfT9KK5cZqYRAC5m", "sD8x8zFOk7atIx1n7Ei5NmAFOkvLkLlnlqDZ8gvPURnaEB1hrcoOxaJgh0tZp6wf")
	    client.authorize_from_access(@user.linkedin_token, @user.linkedin_secret)
	    begin
	    	
	    	@authenticated = true
				#@profile = client.profile(:fields => %w(picture_url))
				#@linkedin_id = client.profile(:fields => %w(id))
				@public_linkedin = client.profile(:url => @user.linkedin_url, :fields => %w(picture_url,first_name,last_name))
		    #@connections = client.connections
			rescue Exception
				flash[:notice] = 'Connection with LinkedIn failed, please authenticate again.'
				@authenticated = false
	    end
	  else
	  	@authenticated = false
		end
=end
		@current_participant = Participant.find_by_user_id(@current_user.id) if Participant.find_by_user_id(@current_user.id)
	end
  
  def last_meeting
  	@meeting = Meeting.find(:last)
		redirect_to @meeting
		#@participants = Participant.find_all_by_meeting_id(params[:id])
		#@current_participant = Participant.find_by_user_id(@current_user.id) if Participant.find_by_user_id(@current_user.id)
	end

end
