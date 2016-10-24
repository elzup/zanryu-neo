Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'top#index'
  resources :requests
  post 'requests/all' => 'requests#create_all'
  post 'requests/all_dell' => 'requests#destroy_all'

  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
  }
  resources :csvs

end
