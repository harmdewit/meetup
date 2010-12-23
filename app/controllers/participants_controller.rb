class ParticipantsController < ApplicationController
  # POST /participants
  # POST /participants.xml
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
      redirect_to(@meeting, :notice => 'Participant was successfully created.')
    else
			render :action => 'new'
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.xml
  def destroy
  	@meeting = Meeting.find(params[:meeting_id])
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to(@meeting) }
      format.xml  { head :ok }
    end
  end

end
