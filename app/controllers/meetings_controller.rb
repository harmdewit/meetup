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
	end

end
