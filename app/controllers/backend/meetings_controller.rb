class Backend::MeetingsController < Backend::BackendController
  # GET /backend/meetings
  # GET /backend/meetings.xml
  def index
    @backend_meetings = Backend::Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backend_meetings }
    end
  end

  # GET /backend/meetings/1
  # GET /backend/meetings/1.xml
  def show
    @backend_meeting = Backend::Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backend_meeting }
    end
  end

  # GET /backend/meetings/new
  # GET /backend/meetings/new.xml
  def new
    @backend_meeting = Backend::Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backend_meeting }
    end
  end

  # GET /backend/meetings/1/edit
  def edit
    @backend_meeting = Backend::Meeting.find(params[:id])
  end

  # POST /backend/meetings
  # POST /backend/meetings.xml
  def create
    @backend_meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @backend_meeting.save
        format.html { redirect_to(backend_meeting_path(@backend_meeting), :notice => 'Meeting was successfully created.') }
        format.xml  { render :xml => @backend_meeting, :status => :created, :location => @backend_meeting }
      else
        format.html { render :action => 'new'}
        format.xml  { render :xml => @backend_meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backend/meetings/1
  # PUT /backend/meetings/1.xml
  def update
    @backend_meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @backend_meeting.update_attributes(params[:meeting])
        format.html { redirect_to(backend_meeting_path(@backend_meeting), :notice => 'Meeting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backend_meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/meetings/1
  # DELETE /backend/meetings/1.xml
  def destroy
    @backend_meeting = Backend::Meeting.find(params[:id])
    @backend_meeting.destroy

    respond_to do |format|
      format.html { redirect_to(backend_meetings_url) }
      format.xml  { head :ok }
    end
  end
end
