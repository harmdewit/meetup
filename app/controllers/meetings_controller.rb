class MeetingsController < ApplicationController
  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @meeting = Meeting.find(params[:id])
		
  end
  
  def show_participants
  	@meeting = Meeting.find(params[:id])
	end
  
  def last_meeting
  	@meeting = Meeting.find(:last)
		redirect_to @meeting
		#@participants = Participant.find_all_by_meeting_id(params[:id])
		#@current_participant = Participant.find_by_user_id(@current_user.id) if Participant.find_by_user_id(@current_user.id)
	end

end
