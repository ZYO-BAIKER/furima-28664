Rails.application.routes.draw do
  devise_for :users
  # root to: 'posts#index' # localhost:3000 にアクセスした時に実行される処理
  resources :users, only: [:edit, :update]
end