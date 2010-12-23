class Admin::AdminController < ActionController::Base
	before_filter :authenticate_admin!
	layout "admin/application"


end
