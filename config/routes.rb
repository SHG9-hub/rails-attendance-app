Rails.application.routes.draw do
  devise_for :users
  
  root "attendances#index"
  
  # 必要なルートのみ定義
  resources :attendances, only: [:index, :create, :update, :destroy]
end
