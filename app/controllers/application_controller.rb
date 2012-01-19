class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :authenticate_user
	
	protected
	
	def authenticate_user
		unless devise_controller?
			if User.where(id: session[:id]).exists?
				@current_user = User.find_by_id(session[:id])
			else
				session[:id] = nil
				redirect_to login_url, :notice => "Please log in."
			end
		end
	end
	
	private 
	
	def after_sign_out_path_for(resource_or_scope)
    backend_root_path
  end

end

