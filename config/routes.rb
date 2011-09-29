Hub::Application.routes.draw do

  #root :to => 'builds#index', :constraints => lambda {|r| r.env["warden"].authenticate? }
  #get "/" => 'pages#builds', :as => "user_root"

  match "/classes" => redirect("/classes/barbarian")

  match "/users/:id(.:format)" => redirect("/users/%{id}/builds")

  devise_for :users, :path_prefix => 'd'

  resources :users do
    resources :builds
  end

  resources :fork_builds

  resources :runes

  resources :skill_types

  resources :char_classes, :path => "/classes" do
    member do
      get 'builds'
    end
    resources :skills  do
      collection do
        get 'actives'
        get 'passives'
      end
      member do
        get 'tooltip'
        get 'drilldown'
      end
      resources :rune_effects do
        member do
           get 'tooltip'
        end
      end
    end
  end

  match "/builds" => "pages#builds"

  root :to => "pages#index"

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

