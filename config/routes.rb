Rails.application.routes.draw do
  resources :events, only: [ :new, :create, :show]
  resources :sessions, only: [ :new, :create, :destroy]
  resources :users, only: [ :new, :create, :show]
  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'register_event', to: 'events#register_event'
  get 'my_events', to: 'users#show'
end