Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users

  # root -> ルートパス(localhost:3000)にアクセスした場合に割り当てられる設定
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:index, :create]
  end

end
