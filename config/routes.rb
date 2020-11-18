Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end