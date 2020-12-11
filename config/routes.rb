Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only:[:create,:update,:destroy] do
      member do
        get 'restore'
      end
    end
  end
end