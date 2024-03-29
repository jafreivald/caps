CAPS::Application.routes.draw do
  
  use_doorkeeper

  resources :fields


  resources :resource_authorizations


  resources :resource_types


  resources :activity_updates


  resources :actions


  resources :activities


  resources :contact_numbers


  resources :phone_numbers


  resources :role_definitions


  resources :resource_utilizations


  resources :activity_types


  resources :contact_methods


  resources :fhir_base_urls


  resources :phone_providers


  resources :phone_types


  resources :resources do
    member do
      post 'import'
      post 'search'
    end
  end


  resources :roles


  resources :severity_levels


  resources :update_actions

  resources :profiles
  resources :sessions do
    member do
      get 'password_reset'
      post 'send_confirmation_email'
      get 'new_password'
    end
  end  
  
  get 'signup', to: 'profiles#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'password_reset', to: 'sessions#password_reset', as: 'password_reset'
  post 'password_reset', to: 'sessions#send_confirmation_email', as: 'password_reset'
  get 'new_password', to: 'sessions#new_password', as: 'new_password'
  


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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
