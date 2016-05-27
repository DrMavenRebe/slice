Slice::Application.routes.draw do
  require 'sidekiq/web'
  require 'sidetiq/web'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions'}

  devise_scope :user do
    get '/logout' => 'devise/sessions#destroy'
  end

  namespace :api do
    get 'user', controller: 'users', action: 'show'
    get 'body_measurements', controller: 'body_measurements', action: 'show'
    resources :activities, only: [:index, :create]
    resources :foods, only: [:index]
  end

  namespace :events do
    resources :steps, only: :index
  end

  resources :notifications
  resources :dashboards, only: :index
  resources :live_step_counters, only: :index
  resources :profiles, only: [:index, :update]

  root to: 'marketing#index'
end
