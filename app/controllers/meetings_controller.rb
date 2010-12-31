class MeetingsController < ApplicationController

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
