class Admin::ConnectionsController < Admin::AdminController
	
	def index
		@meeting = Meeting.find(:last)
		@participants = @meeting.participants
    @select_options = Array.new
    @connection = Connection.new
    @participants.each do |p|
  		@select_options.push p
		end
	end
	
	def new
  	@participant = Participant.find(params[:participant_id])
    @connection = Connection.new
    @select_options = Array.new
    @participant.meeting.participants.each do |p|
  		@select_options.push ["#{p.user.first_name} #{p.user.last_name}", p.id]
		end
	end
	
	def create
		@participant = Participant.find(params[:participant_id])
		@connected_participant = Participant.find(params[:connected_participant_id])
		params[:connection1] = {
			:participant_id => @participant.id, 
			:connected_participant_id => @connected_participant.id, 
			:status => 'Aanbevolen'}
		params[:connection2] = {
			:participant_id => @connected_participant.id, 
			:connected_participant_id => @participant.id, 
			:status => 'Aanbevolen'}
		@connection1 = Connection.new(params[:connection1])
		@connection2 = Connection.new(params[:connection2])
    if @connection1.save && @connection2.save
  		@meeting =  @connected_participant.meeting
      redirect_to( admin_connections_url, :notice => "#{@participant.user.first_name} #{@participant.user.last_name} is nu aanbevolen aan #{@connected_participant.user.first_name} #{@connected_participant.user.last_name}.")
    end
	end
end
