class Backend::ParticipantsController < Backend::backendController
  # GET /backend/participants
  # GET /backend/participants.xml
  def index
    @backend_participants = Backend::Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backend_participants }
    end
  end

  # GET /backend/participants/1
  # GET /backend/participants/1.xml
  def show
    @backend_participant = Backend::Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backend_participant }
    end
  end

  # GET /backend/participants/new
  # GET /backend/participants/new.xml
  def new
    @backend_participant = Backend::Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backend_participant }
    end
  end

  # GET /backend/participants/1/edit
  def edit
    @backend_participant = Backend::Participant.find(params[:id])
  end

  # POST /backend/participants
  # POST /backend/participants.xml
  def create
    @backend_participant = Backend::Participant.new(params[:backend_participant])

    respond_to do |format|
      if @backend_participant.save
        format.html { redirect_to(@backend_participant, :notice => 'Participant was successfully created.') }
        format.xml  { render :xml => @backend_participant, :status => :created, :location => @backend_participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backend_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backend/participants/1
  # PUT /backend/participants/1.xml
  def update
    @backend_participant = Backend::Participant.find(params[:id])

    respond_to do |format|
      if @backend_participant.update_attributes(params[:backend_participant])
        format.html { redirect_to(@backend_participant, :notice => 'Participant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backend_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/participants/1
  # DELETE /backend/participants/1.xml
  def destroy
    @backend_participant = Backend::Participant.find(params[:id])
    @backend_participant.destroy

    respond_to do |format|
      format.html { redirect_to(backend_participants_url) }
      format.xml  { head :ok }
    end
  end
end
