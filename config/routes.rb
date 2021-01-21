Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  get 'items/search'
 
  resources :users, only: [:edit, :update, :show]

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only:[:create,:update,:destroy] 
  end
end