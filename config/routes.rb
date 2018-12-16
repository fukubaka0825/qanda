Rails.application.routes.draw do
  get 'home/index'
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # ルートパスにアクセスでindexアクション
  root 'home#index'
  # 必要なルーティング用意
  resources :questions do
    resources :answers
  end
  resources :users, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
