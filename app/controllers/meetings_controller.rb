class MeetingsController < ApplicationController	
  def show
    @meeting = Meeting.find(params[:id])
    @current_participant = Participant.find_by_user_id_and_meeting_id(@current_user, @meeting)
    @latest_participants = @meeting.participants.limit(3);
  end
  
  def show_participants
  	@meeting = Meeting.find(params[:id])
    @participants = Participant.find_all_by_meeting_id(@meeting.id)
    @current_participant = Participant.find_by_user_id_and_meeting_id!(@current_user.id, @meeting.id)
    @current_connected_participants = Array.new
    @current_connected_participants_connections = Array.new
    @suggested_participants = Array.new
    @current_participant.connections.each do |c|
    	@participants.unshift(@participants.delete(c.connected_participant))
  	end
    @current_participant.connections.each do |c|
    	if c.status == 'Aanbevolen'
    		@participants.unshift(@participants.delete(c.connected_participant))
    		@suggested_participants.push c.connected_participant
			else
	    	@current_connected_participants.push c.connected_participant
    		@current_connected_participants_connections.push c
  		end
		end
    @participants.unshift(@participants.delete(@current_participant))
	end
  
  def last_meeting
  	@meeting = Meeting.find(:last)
		redirect_to @meeting
	end

end
