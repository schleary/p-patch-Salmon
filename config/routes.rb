require 'resque/server'

Rails.application.routes.draw do

  mount Resque::Server, :at => "/resque"

  resources :tools, :posts, :sessions, :users, :calendars

  get   "/home/index",            to: "home#index",    as: :home_index
  root                                "home#index",    as: :root

  get   '/auth/twitter/callback', to: 'users#create',  as: :twitter_callback
  post  '/auth/twitter/callback', to: 'users#create'

  get   '/users/:id/confirm',      to: 'users#confirm', as: :confirm_user

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

# tools_path	GET	/tools(.:format)	tools#index
# post	/tools(.:format)	tools#create
# new_tool_path	GET	/tools/new(.:format)	tools#new
# edit_tool_path	GET	/tools/:id/edit(.:format)	tools#edit
# tool_path	GET	/tools/:id(.:format)	tools#show
# PATCH	/tools/:id(.:format)	tools#update
# PUT	/tools/:id(.:format)	tools#update
# DELETE	/tools/:id(.:format)	tools#destroy
# posts_path	GET	/posts(.:format)	posts#index
# post	/posts(.:format)	posts#create
# new_post_path	GET	/posts/new(.:format)	posts#new
# edit_post_path	GET	/posts/:id/edit(.:format)	posts#edit
# post_path	GET	/posts/:id(.:format)	posts#show
# PATCH	/posts/:id(.:format)	posts#update
# PUT	/posts/:id(.:format)	posts#update
# DELETE	/posts/:id(.:format)	posts#destroy
# account_path	GET	/users/:id/account(.:format)	users#account
# home_index_path	GET	/home/index(.:format)	home#index
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
  #   end
end
