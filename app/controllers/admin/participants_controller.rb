class Admin::ParticipantsController < Admin::AdminController
  # GET /admin/participants
  # GET /admin/participants.xml
  def index
    @admin_participants = Admin::Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_participants }
    end
  end

  # GET /admin/participants/1
  # GET /admin/participants/1.xml
  def show
    @admin_participant = Admin::Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_participant }
    end
  end

  # GET /admin/participants/new
  # GET /admin/participants/new.xml
  def new
    @admin_participant = Admin::Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_participant }
    end
  end

  # GET /admin/participants/1/edit
  def edit
    @admin_participant = Admin::Participant.find(params[:id])
  end

  # POST /admin/participants
  # POST /admin/participants.xml
  def create
    @admin_participant = Admin::Participant.new(params[:admin_participant])

    respond_to do |format|
      if @admin_participant.save
        format.html { redirect_to(@admin_participant, :notice => 'Participant was successfully created.') }
        format.xml  { render :xml => @admin_participant, :status => :created, :location => @admin_participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/participants/1
  # PUT /admin/participants/1.xml
  def update
    @admin_participant = Admin::Participant.find(params[:id])

    respond_to do |format|
      if @admin_participant.update_attributes(params[:admin_participant])
        format.html { redirect_to(@admin_participant, :notice => 'Participant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/participants/1
  # DELETE /admin/participants/1.xml
  def destroy
    @admin_participant = Admin::Participant.find(params[:id])
    @admin_participant.destroy

    respond_to do |format|
      format.html { redirect_to(admin_participants_url) }
      format.xml  { head :ok }
    end
  end
end
