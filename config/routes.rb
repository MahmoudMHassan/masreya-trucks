Rails.application.routes.draw do

  get 'pictures/new'

  get 'pictures/create'

  get 'pictures/show'
post 'pictures/new' => 'pictures#create'

  #get 'ads/search_make' => 'ads#search_make'
  get 'ads/search_make'
  get 'ads/search/:page' => 'ads#search'

  resources :makes


  get 'makes/new'

  get 'makes/edit'

  get 'makes/show'

  get 'makes/update'

  get 'makes/delete'

  get 'makes/destroy'

  get 'makes/index'
  post 'makes/new' =>'makes#create'

resources :vehicles
  get 'vehicles/new'

  get 'vehicles/create'

  get 'vehicles/edit'

  get 'vehicles/delete'

  get 'vehicles/destroy'

  get 'vehicles/update'

  get 'vehicles/index'

  get 'vehicles/show'

  post 'vehicles/new' => 'vehicles#create'

  root :to => 'ads#home'

  #AD
  get 'search/:page' => 'ads#search'

  get 'search/:page' => 'ads#search'
  get 'vansearch/:page' => 'ads#vansearch'
  get 'ads/sttsearch/:page' => 'ads#sttsearch'
  get 'ads/semisearch/:page' => 'ads#semisearch'
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
  post 'ads/new' => 'ads#create'
    resources :ads

  get 'sessions/destroy'

  get 'users/bookmark/:id' => 'users#bookmark'
  get 'users/new'
  post 'users/new'=> 'users#create'
  get 'users/signin'
  get 'users/show'
  get 'users/:id' => 'users#show'
  get 'users/edit/:id' => 'users#edit'
  get 'users/changetoseller/:id' => 'users#changetoseller'
  #get 'makes/new'

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

