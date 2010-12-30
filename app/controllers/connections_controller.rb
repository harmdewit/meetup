class ConnectionsController < ApplicationController
	skip_before_filter :authenticate_user, :only => :index
	layout 'login'
	
  # GET /connections
  # GET /connections.xml
  def index
    @connections = Connection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @connections }
    end
  end

  # GET /connections/1
  # GET /connections/1.xml
  def show
    @connection = Connection.find(params[:id])
		@meeting = Meeting.find(5)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @connection }
    end
  end

  # GET /connections/new
  # GET /connections/new.xml
  def new
  	@participant = Participant.find(params[:participant_id])
    @connection = Connection.new

  end

  # GET /connections/1/edit
  def edit
    @connection = Connection.find(params[:id])
  end
  
  def create
    @connected_participant = Participant.find(params[:participant_id])
  	@current_participant = Participant.find_by_user_id_and_meeting_id!(@current_user, @connected_participant.meeting_id)
		params[:connection1] = {
			:participant_id => @current_participant.id, 
			:connected_participant_id => @connected_participant.id, 
			:status => 'accepted'}
		params[:connection2] = {
			:participant_id => @connected_participant.id, 
			:connected_participant_id => @current_participant.id, 
			:status => 'accepted'}
		@connection1 = Connection.new(params[:connection1])
		@connection2 = Connection.new(params[:connection2])
    respond_to do |format|
      if @connection1.save && @connection2.save
        format.html { redirect_to(meeting_participants_url(@connected_participant.meeting), :notice => '@connection was successfully created.') }
        format.xml  { render :xml => @admin_meeting, :status => :created, :location => @admin_meeting }
      else
        format.html { render :action => 'new'}
        format.xml  { render :xml => @admin_meeting.errors, :status => :unprocessable_entity }
      end
    end
  end
=begin
	def create
		@user = User.find(@current_user)
		@connected_user = User.find(params[:connected_user_id])
		params[:connection1] = {:user_id => @user.id, :connected_user_id => @connected_user.id, :status => 'requested'}
		params[:connection2] = {:user_id => @connected_user.id, :connected_user_id => @user.id, :status => 'pending'}
		@connection1 = Connection.create(params[:connection1])
		@connection2 = Connection.create(params[:connection2])
		if @connection1.save && @connection2.save
			redirect_to user_path(@current_user)
					flash[:notice] = 'User sucessfully requested!'
		else
					flash[:notice] = 'Failed to request user!'
			redirect_to user_path(@current_user)
		end
	end
=end
	
	
	def update
		@user = User.find(@current_user)
		@connected_user = User.find(params[:connected_user_id])
		params[:connection1] = {:user_id => @user.id, :connected_user_id => @connected_user.id, :status => 'accepted'}
		params[:connection2] = {:user_id => @connected_user.id, :connected_user_id => @user.id, :status => 'accepted'}
		@connection1 = Connection.find_by_user_id_and_connected_user_id(@user.id, @connected_user.id)
		@connection2 = Connection.find_by_user_id_and_connected_user_id(@connected_user.id, @user.id)
		if @connection1.update_attributes(params[:connection1]) && @connection2.update_attributes(params[:connection2])
			flash[:notice] = 'Friend sucessfully accepted!'
			redirect_to user_path(@current_user)
		else
			flash[:error] = 'Friend not accepted!'
			redirect_to user_path(@current_user)
		end
	end
	
	def destroy
		@user = User.find(params[:user_id])
		@connected_user = User.find(params[:connected_user_id])
		@connection1 = @user.connections.find_by_connected_user_id(params[:connected_user_id]).destroy
		@connection2 = @connected_user.connections.find_by_user_id(params[:user_id]).destroy
		redirect_to user_path(@current_user)
		flash[:notice] = 'Friend not accepted!'
	end
end
