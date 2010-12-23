class Admin::MeetingsController < Admin::AdminController
  # GET /admin/meetings
  # GET /admin/meetings.xml
  def index
    @admin_meetings = Admin::Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_meetings }
    end
  end

  # GET /admin/meetings/1
  # GET /admin/meetings/1.xml
  def show
    @admin_meeting = Admin::Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_meeting }
    end
  end

  # GET /admin/meetings/new
  # GET /admin/meetings/new.xml
  def new
    @admin_meeting = Admin::Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_meeting }
    end
  end

  # GET /admin/meetings/1/edit
  def edit
    @admin_meeting = Admin::Meeting.find(params[:id])
  end

  # POST /admin/meetings
  # POST /admin/meetings.xml
  def create
    @admin_meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @admin_meeting.save
        format.html { redirect_to(admin_meeting_path(@admin_meeting), :notice => 'Meeting was successfully created.') }
        format.xml  { render :xml => @admin_meeting, :status => :created, :location => @admin_meeting }
      else
        format.html { render :action => 'new'}
        format.xml  { render :xml => @admin_meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/meetings/1
  # PUT /admin/meetings/1.xml
  def update
    @admin_meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @admin_meeting.update_attributes(params[:meeting])
        format.html { redirect_to(admin_meeting_path(@admin_meeting), :notice => 'Meeting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/meetings/1
  # DELETE /admin/meetings/1.xml
  def destroy
    @admin_meeting = Admin::Meeting.find(params[:id])
    @admin_meeting.destroy

    respond_to do |format|
      format.html { redirect_to(admin_meetings_url) }
      format.xml  { head :ok }
    end
  end
end
