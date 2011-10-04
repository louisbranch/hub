Hub::Application.routes.draw do

  match "/classes" => redirect("/classes/barbarian")

  match "/users/:id(.:format)" => redirect("/users/%{id}/builds")

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

  root :to => "pages#index"

end

