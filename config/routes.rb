McDb::Engine.routes.draw do
  resources :settings

  root :to => "application#index"

  resources :reports

  resources :punishments

  resources :servers

  resources :groups

  resources :clusters


end
