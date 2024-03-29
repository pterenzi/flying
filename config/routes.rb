Flying::Application.routes.draw do
  

  devise_for :users

  resources :aircraft_types do
    member do
      get 'busca_aircraft_type'
    end
  end

  resources :clients do
    member do
      get 'retrieve_client_dac'
      get 'show_by_name'
      get 'id_by_name'
    end
    get 'pesquisa_nomes', :on => :collection
  end

  resources :instructors do
    member do
      get 'retrieve_instructor_dac'
      get 'show_by_name'
    end
    get 'search_names', :on => :collection

  end
  get "admins/manage_permission"
  get "admins/change_level"
  get "admins/new_user"
  post "admins/create_user"
  
  resources :sales

  resources :entries

  resources :suppliers do
    get 'show_by_name', :on => :member
    get 'id_by_name',   :on => :member
    get 'search_names', :on => :collection
  end

  root :to => 'flights#index'

  resources :debts

  resources :accounts do
    collection do
      get 'cash_flow'
    end
  end

  resources :flights do
    member do
      get 'load_aircraft_type_form'
      get 'print_notification'
    end
  end

  resources :packages do
    member do
      get 'busca_pacote'
    end
  end


  resources :aircrafts do
    member do
      get 'retrieve_aircraft_type_name'
    end
  end

  # get :autocomplete_client_name, :on => :collection

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
