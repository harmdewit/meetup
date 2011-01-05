class MeetingsController < ApplicationController	
  def show
    @meeting = Meeting.find(params[:id])
    @current_participant = Participant.find_by_user_id_and_meeting_id(@current_user, @meeting)
    @latest_participants = @meeting.participants.limit(3);
  end
  
  def show_participants
  	@meeting = Meeting.find(params[:id])
    @current_participant = Participant.find_by_user_id_and_meeting_id(@current_user, @meeting)
	end
  
  def last_meeting
  	@meeting = Meeting.find(:last)
		redirect_to @meeting
	end

end
