Rails.application.routes.draw do
  resources :events, only: [:show, :new, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  root 'users#new'
end
