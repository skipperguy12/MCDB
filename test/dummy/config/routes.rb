Rails.application.routes.draw do

  # This line mounts McDb's routes at /admin by default.
  # This means, any requests to the /admin URL of your application will go to McDb::ApplicationController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as McDb relies on it being the default of "mcdb"
  mount McDb::Engine, :at => '/admin'

  devise_for :users
  resources :users
end
