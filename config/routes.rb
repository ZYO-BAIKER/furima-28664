Rails.application.routes.draw do
  root to: 'posts#index' # localhost:3000 にアクセスした時に実行される処理
  resources :posts, only: [:index]
end