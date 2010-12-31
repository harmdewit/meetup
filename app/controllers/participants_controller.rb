class ParticipantsController < ApplicationController
	layout "login"

=begin	
	  def index
    @participants = Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @connections }
    end
  end
=end

  def show
    @participant = Participant.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @connection }
    end
  end

  def new
		@meeting = Meeting.find(params[:meeting_id])
  	@participant = Participant.new
	end
	
	
  def create
  	@meeting = Meeting.find(params[:meeting_id])
  	@participant = Participant.new(params[:participant])
		@participant.user_id = @current_user.id
		@participant.meeting_id = params[:meeting_id]
    if @participant.save
      redirect_to(meeting_participants_url(@meeting), :notice => 'You have succesfully signed in to the meeting.')
    else
			render :action => 'new'
    end
  end

  def destroy
  	@meeting = Meeting.find(params[:meeting_id])
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to(@meeting, :notice => 'You have succesfully signed off from the meeting.') }
      format.xml  { head :ok }
    end
  end

end
