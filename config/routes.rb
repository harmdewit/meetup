Portal::Application.routes.draw do

	root :to => "meetings#last_meeting"

	resources :meetings, :only => :show do
		resources :participants, :except => :index do
			get 'destroy_confirmation', :on => :member
		end
	end
	match 'meetings/:id/participants' => 'meetings#show_participants', :as => 'meeting_participants'
	match 'meetings' => 'meetings#last_meeting', :as => 'last_meeting'
	
	resources :participants, :only => :show do
		resources :connections
	end
	
	resources :users, only: [:new]
	match '/users/create' => 'users#create', as: 'create_user'
	
	match '/login' => 'sessions#new', as: 'login'
	match '/logout' => 'sessions#destroy', as: 'logout'
	match '/auth/linkedin', as: 'authenticate_linkedin'
	match '/auth/linkedin/callback' => 'sessions#create'
	resources :sessions, only: :destroy
	
	
	
	match 'backend' => 'backend/meetings#index', as: 'backend_root'
	namespace "backend" do
		resources :users
		# resources :admins, :only => [:index, :show]
		resources :meetings
		resources :participants do
			resources :connections, :only => [:new, :create]
		end
		resources :connections
	end
	devise_for :admins, controllers: {sessions: 'backend/sessions', passwords: 'backend/passwords', registrations: 'backend/registrations'}
	# devise_for :admins, :path_prefix => 'admin'
	# devise_for :admins, :module => "admin"
	# devise_for :admins, controller: {sessions: 'admin/sessions', passwords: 'admin/passwords', registrations: 'admin/registrations'}


	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#		match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#		match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
	# This route can be invoked with purchase_url(:id => product.id)

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#		resources :products

	# Sample resource route with options:
	#		resources :products do
	#			member do
	#				get 'short'
	#				post 'toggle'
	#			end
	#
	#			collection do
	#				get 'sold'
	#			end
	#		end

	# Sample resource route with sub-resources:
	#		resources :products do
	#			resources :comments, :sales
	#			resource :seller
	#		end

	# Sample resource route with more complex sub-resources
	#		resources :products do
	#			resources :comments
	#			resources :sales do
	#				get 'recent', :on => :collection
	#			end
	#		end

	# Sample resource route within a namespace:
	#		namespace :admin do
	#			# Directs /admin/products/* to Admin::ProductsController
	#			# (app/controllers/admin/products_controller.rb)
	#			resources :products
	#		end

	# You can have the root of your site routed with "root"
	# just remember to delete public/index.html.
	# root :to => "meetings#last_meeting"

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id(.:format)))'
end
