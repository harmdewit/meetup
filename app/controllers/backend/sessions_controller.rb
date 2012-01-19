class Backend::SessionsController < ::Devise::SessionsController
	skip_before_filter :authenticate_admin!
	
	layout "backend/login"
end