Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'top#index'
  resources :requests
  post 'requests/all' => 'requests#create_all'
  post 'requests/all_dell' => 'requests#destroy_all'

  resources :csvs

end
