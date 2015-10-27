Rails.application.routes.draw do
  
  resources :description_templates
  resources :image_files
  resources :custom_tailorings
  resources :options
  resources :variants
  resources :products
  resources :affiliate_reward_settings
  resources :premium_reward_settings
  resources :premium_accounts
  resources :missed_coupons
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
  resources :product_descriptions
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
    get '/missed_coupons/:id/created' => 'missed_coupons#created', :as => "missed_coupon_created"
    get '/premium_accounts_all/' => 'premium_accounts#showall', :as => "premium_accounts_show_all"
    get 'products_all' => 'products#getProducts' , :as => "get_all_products"
    get 'product_descriptions_by_id/:product_id' => 'product_descriptions#descriptions_by_product', :as => "get_products_descriptions"
    get '/getPresets/:customer_id' => 'custom_tailorings#getPresets', :as => "get_presets"
    get '/transactions_customer/:customer_id' => 'transactions#transactions_customer', :as => "transactions_customer"
    get '/coupons_customer/:customer_id' => 'codes#coupons_customer', :as => "coupons_customer"
    get '/getProductsByTitle/:title' => 'product_descriptions#getProductsByTitle', :as => "get_products_by_title"
    get 'addDescriptionTemplateToProduct/:id' => 'description_templates#addDescriptionTemplateToProduct', :as =>"add_description_template_to_product"
    post 'addDT' => 'description_templates#addDt', :as => 'addDt'
    get 'checkCustomer/:email' => 'customers#checkCustomer', :as => 'checkCustomer'
    post 'checkCustomer/' => 'customers#checkCustomer', :as => 'checkCustomerPost'
  end

  root :to => 'products#index'
  
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
