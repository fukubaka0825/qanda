Rails.application.routes.draw do
 get 'mypage' ,to: 'users#me'
 get 'login' ,to: 'session#create'
 get 'logout' ,to: 'session#destroy'
  # ルートパスにアクセスでindexアクション
  root 'questions#index'
  # 必要なルーティング用意
  resources :questions do
    resources :answers
  end
  resources :users, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
