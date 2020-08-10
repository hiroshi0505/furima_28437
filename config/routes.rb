Rails.application.routes.draw do
  devise_for :users

  # root -> ルートパス(localhost:3000)にアクセスした場合に割り当てられる設定
  root to: 'items#index'
  resources :items

  resources :items do
    member do
      get :purchase
    end
  end

end
