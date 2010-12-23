class Admin::AdminsController < Admin::AdminController

	
	# GET /admins
  # GET /admins.xml
  def index
 
    @admins = Admin.all
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.xml
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin }
    end
  end
  
end
