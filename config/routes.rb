ActionController::Routing::Routes.draw do |map|

  map.resources :tools
  map.resources :services
  map.resources :experiences
  map.resources :companies
  map.resources :users
  map.resources :passwords
	map.resources :users, :has_one => [:password]

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'companies', :action => 'new'
  map.search '/search', :controller => 'companies', :action => 'search'
  map.about '/about', :controller => 'pages', :action => 'about'
  map.success '/success', :controller => 'pages', :action => 'success'
	
	map.with_options :controller => 'contact' do |c|
		c.contact '/contact-us',
		  :action => 'index',
		  :conditions => { :method => :get }

		c.contact '/contact-us',
		  :action => 'create',
		  :conditions => { :method => :post }
	end
  
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  
  map.resources :companies, :has_many => [:tools, :experiences, :softwares]
  map.resources :companies, :has_many => :users

  map.resource :session
  
  map.root :controller => 'sessions', :action => 'index'
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
