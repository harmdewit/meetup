class MeetingsController < ApplicationController	
  def show
    @meeting = Meeting.find(params[:id])
    @current_participant = Participant.find_by_user_id_and_meeting_id(@current_user, @meeting)
    @latest_participants = @meeting.participants.limit(3).order('id DESC');
  end
  
  def show_participants
  	@meeting = Meeting.find(params[:id])
    @current_participant = Participant.find_by_user_id_and_meeting_id!(@current_user, @meeting)
    @current_connected_participants = Array.new
    @current_connected_participants_connections = Array.new
    @current_participant.connections.each do |c|
    	@current_connected_participants.push c.connected_participant
    	@current_connected_participants_connections.push c
  	end
	end
  
  def last_meeting
  	@meeting = Meeting.find(:last)
		redirect_to @meeting
	end

end
