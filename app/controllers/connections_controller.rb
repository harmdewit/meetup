class ConnectionsController < ApplicationController
	skip_before_filter :authenticate_user, :only => :index
	layout 'login'

  # GET /connections/new
  # GET /connections/new.xml
  def new
  	@participant = Participant.find(params[:participant_id])
    @connection = Connection.new
  end
  
  def create
    @connected_participant = Participant.find_by_id!(params[:participant_id])
  	@current_participant = Participant.find_by_user_id_and_meeting_id!(@current_user, @connected_participant.meeting_id)
		params[:connection1] = {
			:participant_id => @current_participant.id, 
			:connected_participant_id => @connected_participant.id, 
			:status => 'Accepted'}
		params[:connection2] = {
			:participant_id => @connected_participant.id, 
			:connected_participant_id => @current_participant.id, 
			:status => 'Accepted'}
		@connection1 = Connection.new(params[:connection1])
		@connection2 = Connection.new(params[:connection2])
    if @connection1.save && @connection2.save
  		@meeting =  @connected_participant.meeting
    	Notifier.request_received(@current_user, @connected_participant.user).deliver
      redirect_to(meeting_participants_url(@current_participant.meeting.id), :notice => "Je hebt nu een connectie met #{@connected_participant.user.first_name} #{@connected_participant.user.last_name}.")
    else 
	  	if Connection.find_by_participant_id_and_connected_participant_id(@current_participant.id, @connected_participant.id)
  			@connection1 = Connection.find_by_participant_id_and_connected_participant_id(@current_participant.id, @connected_participant.id)
  			@connection2 = Connection.find_by_connected_participant_id_and_participant_id(@current_participant.id, @connected_participant.id)
  			@connection1.status = 'Accepted'
  			@connection2.status = 'Accepted'
  			if @connection1.save && @connection2.save
  				Notifier.request_received(@current_user, @connected_participant.user).deliver
      		redirect_to(meeting_participants_url(@current_participant.meeting.id), :notice => "Je hebt nu een connectie met #{@connected_participant.user.first_name} #{@connected_participant.user.last_name}.")
    		else
    			flash[:error] = 'Friend not accepted!'
					redirect_to meeting_participants_url(@current_participant.meeting.id)
				end
			else
	      flash[:error] = "Je hebt deze persoon al toevoegd jongen."
	      redirect_to meeting_participants_url(@current_participant.meeting.id)
      end
    end
  end
	
  def edit
		@participant = Participant.find(params[:participant_id])
		@connection = Connection.find(params[:id])
	end
	
	def update
		@user = User.find(@current_user)
		@connected_user = User.find(params[:connected_user_id])
		params[:connection1] = {:user_id => @user.id, :connected_user_id => @connected_user.id, :status => 'Accepted'}
		params[:connection2] = {:user_id => @connected_user.id, :connected_user_id => @user.id, :status => 'Accepted'}
		@connection1 = Connection.find_by_user_id_and_connected_user_id(@user.id, @connected_user.id)
		@connection2 = Connection.find_by_user_id_and_connected_user_id(@connected_user.id, @user.id)
		if @connection1.update_attributes(params[:connection1]) && @connection2.update_attributes(params[:connection2])
			flash[:notice] = 'Friend sucessfully accepted!'
			redirect_to user_path(@current_user)
		else
			flash[:error] = 'Friend not accepted!'
			redirect_to user_path(@current_user)
		end
	end
	
	def destroy
		@connection = Connection.find(params[:id])
    @connected_participant = Participant.find(@connection.connected_participant_id)
  	@current_participant = Participant.find(@connection.participant_id)
		@connection1 = Connection.find_by_participant_id_and_connected_participant_id(@current_participant, @connected_participant)
		@connection2 = Connection.find_by_participant_id_and_connected_participant_id(@connected_participant, @current_participant)
		@connection1.destroy
		@connection2.destroy
    
		@meeting =  @connected_participant.meeting
    redirect_to(meeting_participants_url(@meeting.id), :notice => "Je hebt je connectie met #{@connected_participant.user.first_name} #{@connected_participant.user.last_name} verbroken.")
	end
end
