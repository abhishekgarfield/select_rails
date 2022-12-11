Rails.application.routes.draw do
  root "users#index"
  get "users/getinfo/:id" , to:"users#getinfo"
  resources :users
end
