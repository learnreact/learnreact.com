Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :courses
    resources :lessons
    resources :charges
    resources :purchases
  end

  resources :charges
  resources :courses, only: [:index, :show]
  resources :lessons, only: [:show]

  root "pages#index"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
