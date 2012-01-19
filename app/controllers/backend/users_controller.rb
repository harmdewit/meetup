class Backend::UsersController < Backend::BackendController
  # GET /backend/users
  # GET /backend/users.xml
  def index
    @backend_users = Backend::User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backend_users }
    end
  end

  # GET /backend/users/1
  # GET /backend/users/1.xml
  def show
    @backend_user = Backend::User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backend_user }
    end
  end

  # GET /backend/users/new
  # GET /backend/users/new.xml
  def new
    @backend_user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backend_user }
    end
  end

  # GET /backend/users/1/edit
  def edit
    @backend_user = Backend::User.find(params[:id])
  end

  # POST /backend/users
  # POST /backend/users.xml
  def create
    @backend_user = User.new(params[:user])
    @backend_user.ticket = User.generate_ticket
    respond_to do |format|
      if @backend_user.save
				Notifier.registration_request(@backend_user).deliver
        format.html { redirect_to(backend_user_path(@backend_user), :notice => 'User was successfully created.') }
        format.xml  { render :xml => @backend_user, :status => :created, :location => @backend_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backend/users/1
  # PUT /backend/users/1.xml
  def update
    @backend_user = User.find(params[:id])
    @backend_user.ticket = User.generate_ticket
    respond_to do |format|
      if @backend_user.update_attributes(params[:user])
				Notifier.registration_request(@backend_user).deliver
        format.html { redirect_to(backend_user_path(@backend_user), :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/users/1
  # DELETE /backend/users/1.xml
  def destroy
    @backend_user = Backend::User.find(params[:id])
    @backend_user.destroy

    respond_to do |format|
      format.html { redirect_to(backend_users_url) }
      format.xml  { head :ok }
    end
  end
end
