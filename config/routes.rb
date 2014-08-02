McDb::Engine.routes.draw do

  root :to => "application#index"

  resources :punishments

  resources :servers

  resources :groups do
    resources :members
  end

  resources :clusters

  get "autocomplete" => "application#autocomplete", :as => "autocomplete"
end
