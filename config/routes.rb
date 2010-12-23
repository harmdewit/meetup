Portal::Application.routes.draw do

  resources :meetings, :only => :show do
	  resources :participants, :only => [:new, :create, :destroy]
	end

	match 'meetings' => 'meetings#last_meeting'
	match 'meetings/:id/participants' => 'meetings#show_participants'
	
	match 'users/confirmation/:ticket' => 'users#confirmation'
	
	match 'users/confirmation/:ticket/linkedin_authenticate', :to => 'users#linkedin_authenticate'
	match 'users/confirmation/:ticket/linkedin_callback', :to => 'users#linkedin_callback'
	
	match 'sessions/linkedin_authenticate'
	match 'sessions/linkedin_callback'
	
  resources :users
  
	#resources :users do |user|
	#	user.resources :connections
	#end
	
	#devise_for :admins, :controllers => { :sessions => "admin/sessions" }
	resources :connections
	
	controller :sessions do
		get 'login' => :new
		get 'linkedin_authenticate' => :linkedin_authenticate
		get 'linkedin_callback' => :linkedin_callback
		post 'login' => :create
		delete 'logout' => :destroy, :as => 'logout'
	end
	
  devise_for :admins, :controllers => {:sessions => 'admin/sessions'}
	namespace "admin" do
		resources :users
		resources :admins, :only => [:index, :show]
		resources :meetings 
		#resources :participants
	end
	


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "meetings#last_meeting"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
