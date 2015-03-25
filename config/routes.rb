Rails.application.routes.draw do

  get 'vehicles/new'

  get 'vehicles/create'

  get 'vehicles/edit'

  get 'vehicles/delete'

  get 'vehicles/destroy'

  get 'vehicles/update'

  get 'vehicles/index'

  get 'vehicles/show'

  root :to => 'ads#home'
  #SEMITRAILERTRUCK
  get 'semitrailertrucks/index'
  get 'semitrailertrucks/new'
  get 'semitrailertrucks/edit'
  get 'semitrailertrucks/show'
  post 'semitrailertrucks/new' => 'semitrailertrucks#create'
  #HEAVYTRUCK
  get 'heavytrucks/index'
  get 'heavytrucks/new'
  get 'heavytrucks/edit'
  get 'heavytrucks/show'
  post 'heavytrucks/new' => 'heavytrucks#create'
  #SEMITRAILER
  get 'semitrailers/index'
  get 'semitrailers/new'
  get 'semitrailers/edit'
  get 'semitrailers/show'
  post 'semitrailers/new' => 'semitrailers#create'
  #VAN
  get 'vans/index'
  get 'vans/new'
  get 'vans/edit'
  get 'vans/show'
  post 'vans/new' => 'vans#create'
  #AD
  get 'ads/home' => 'ads#home'
  get 'ads/new'
  get 'ads/:id' => 'ads#show'
  post 'ads/bookmark/:id' => 'ads#bookmark'
  post 'ads/unbookmark/:id' => 'ads#unbookmark'
  post 'ads/delete/:id' => 'ads#delete'
  get 'ads/edit/:id' => 'ads#edit'
  post 'ads/edit/:id' => 'ads#update'
   #resources :vehicles
   #resources :vans
   #resources :semitrailertrucks








  get 'sessions/destroy'
  
  get 'users/bookmark/:id' => 'users#bookmark'
  get 'users/new'
  post 'users/new'=> 'users#create'
  get 'users/signin'
  get 'users/show'
  get 'users/:id' => 'users#show'
  get 'users/edit/:id' => 'users#edit'
  post 'users/destroy/:id' => 'users#destroy'
  post 'users/logout' => 'users#logout'
  post 'users/signin' => 'users#login'
  post 'users/edit/:id' => 'users#update'
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
    end

