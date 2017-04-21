Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  root "pages#index"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
