Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :courses
    resources :lessons
    resources :purchases
  end

  resources :courses, only: [:index, :show] do
    scope module: "courses" do
      resources :purchases, only: [:new, :create]
    end
  end
  resources :lessons, only: [:index, :show]
  resources :purchases, only: [:index]
  resources :subscriptions, only: [:new] do
    get 'successful', on: :new # REST exception for analytics tracking
  end

  namespace :my do
    resource :subscription, only: [:show]
  end

  namespace :stripe do
    resources :webhook, only: :create
  end

  root "courses#index"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
