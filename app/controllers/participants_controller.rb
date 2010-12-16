class ParticipantsController < ApplicationController
	before_filter :authenticate_user
  # POST /participants
  # POST /participants.xml
  def new
  	@participant = Participant.new
		@meeting_id = params[:meeting_id]
		@meeting = Meeting.find(@meeting_id)
	end
	
	
  def create
  	@participant = Participant.new(params[:meeting])
		@participant.user_id = @current_user.id
		@participant.meeting_id = params[:meeting_id]
    if @participant.save
      redirect_to(Meeting.find(@participant.meeting_id), :notice => 'Participant was successfully created.')
    else
			render :action => 'new'
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.xml
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end

end
