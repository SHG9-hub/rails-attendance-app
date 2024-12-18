Rails.application.routes.draw do
  # get "users/show"
  devise_for :users

get '/', to: 'top#index'

get 'users/:id', to: 'users#show'

  
end
