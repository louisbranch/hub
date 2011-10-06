Hub::Application.routes.draw do
  
  #root :to => 'pages#builds', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'pages#index'

  #get "/" => 'pages#builds', :as => "user_root"

  match "/classes" => redirect("/classes/barbarian")

  match "/users/:id(.:format)" => redirect("/users/%{id}/builds")
  
  namespace :user do
    root :to => "pages#builds"
  end

  devise_for :users, :path_prefix => 'd'

  resources :users do
    resources :builds do
      resources :comments
    end
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

end

