class Admin::ConnectionsController < Admin::AdminController
	
	def index
		@meeting = Meeting.find(:last)
	end
	
	def new
		@participant = Participant.find(params[:participant_id])
		@participants = Participant.all
		@connection = Connection.new
	end
	
	def create
		@participant = Participant.find(params[:participant_id])
		@connected_participant = Participant.find(params[:connected_participant_id])
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
      redirect_to( meeting_participants_url(@meeting.id), :notice => "You have succesfully connected #{@participant.user.first_name} #{@participant.user.last_name} to #{@connected_participant.user.first_name} #{@connected_participant.user.last_name}.")
    end
	end
end
