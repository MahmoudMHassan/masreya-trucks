Rails.application.routes.draw do

  get 'ads/new'

   resources :vehicles
   resources :vans
   resources :semitrailertrucks
  get 'vehicles/new'=> 'vehicles#create'

  get 'vehicles/edit'

  get 'vehicles/create'
  resources :heavytrucks
  get 'heavytrucks/new'

  post 'heavytrucks/new' => 'heavytrucks#create'
  post 'vans/new' => 'vans#create'
  post 'semitrailertrucks/new' => 'semitrailertrucks#create'

  get 'heavytrucks/create'

  get 'heavytrucks/edit'

  get 'heavytrucks/update'

  get 'heavytrucks/delete'

  get 'heavytrucks/destroy'

  get 'heavytrucks/show'

  get 'heavytrucks/index'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'semitrailers/index'

  get 'semitrailers/new'

  get 'semitrailers/create'

  get 'semitrailers/show'

  get 'semitrailers/delete'

  get 'semitrailers/destroy'

  get 'semitrailers/edit'

  get 'semitrailers/update'

  post 'semitrailers/new' => 'semitrailers#create'

  root :to => 'users#index'

  get 'users/new'
  post 'users/new'=> 'users#create'
  get 'users/index'
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

