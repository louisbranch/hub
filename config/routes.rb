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
        member do
          get 'login'
        end
      resources :comments
      resources :likes do
        member do
          match 'vote'
        end
      end
    end
  end

  resources :fork_builds

  resources :runes

  resources :skill_types
  
  resources :build_types do
    member do
      get 'builds'
    end
  end

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

