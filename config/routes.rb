Rails.application.routes.draw do

  devise_for :users
  # これにより以下のルートが自動生成されます：
  
  # 新規登録関連
  # GET    /users/sign_up         => devise/registrations#new
  # POST   /users                 => devise/registrations#create
  
  # ログイン関連
  # GET    /users/sign_in         => devise/sessions#new
  # POST   /users/sign_in         => devise/sessions#create
  # DELETE /users/sign_out        => devise/sessions#destroy
  
  # パスワード関連
  # GET    /users/password/new    => devise/passwords#new
  # GET    /users/password/edit   => devise/passwords#edit
  # PUT    /users/password        => devise/passwords#update
  # POST   /users/password        => devise/passwords#create

  # ユーザーの操作するルーティング
  # get '/users', to: 'users#index', as: :user_list   # ユーザー一覧ページ
  # get 'users/:id', to: 'users#show', as: :user # ユーザー詳細ページ

  # 下記構文使用必須。
  resources :users, only: %i[show index]  do
    resources :attendances, only: %i[new create update edit ] 
  end

  # 今回ルートをこのようにネストさせた。
  # これにより、アテンダンスのパスはuserを親としてattendanceは子になる。
  # 例)users/:use_id/attendances/new となる。
  #
  #

  


end

