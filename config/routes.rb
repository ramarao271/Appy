Rails.application.routes.draw do
  
  resources :encash_settings
  resources :registration_coupons
  resources :orders
  resources :users
  resources :codes
  resources :discount_generators
  resources :discounts
  resources :registration_settings
  resources :reward_settings
  resources :transactions
  resources :transactions
  resources :customers
  resources :reward_settings
  controller :sessions do
    get 'login' => :new, :as => :login
    post 'login' => :create, :as => :authenticate
    get 'auth/shopify/callback' => :callback
    get 'logout' => :destroy, :as => :logout
    post 'webhooks/customers/create' => 'rewardpoints#customerCreate'
    post 'webhooks/orders/create' => 'rewardpoints#orderCreate'
    get 'webhooks/orders/create' => 'rewardpoints#orderCreate'
    get '/reward_settings/new' => "reward_settings#new", :as => "reward_settings_new"
    get '/discount_generators/:id/generate' => 'discount_generators#generate', :as => "generate_discount_coupons"
    post '/discount_generators/:id/created_for_shopify' => 'discount_generators#created_for_shopify', :as => "created_for_shopify"
    get '/codes/:id/discount_codes/' => 'codes#discount_code', :as => "discount_code"
    post '/customers/redeem' => 'customers#redeem'
    post '/customers/encash' => 'customers#encash'
  end

  root :to => 'home#index'
  
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
  #   end
end
