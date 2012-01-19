class Backend::BackendController < ActionController::Base
	before_filter :authenticate_admin!
	layout "backend/application"
	
	private



end
