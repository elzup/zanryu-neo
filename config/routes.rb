Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'top#index'
  resources :requests
  post 'requests/all' => 'requests#create_all'
  post 'requests/all_dell' => 'requests#destroy_all'

  devise_for :users, :controllers => {
      :confirmations => 'users/confirmations',
      :omniauth_callback => 'users/omniauth_callback',
      :passwords => 'users/passwords',
      :registrations => 'users/registrations',
      :sessions => 'users/sessions',
      :unlocks => 'users/unlocks',
  }
  resources :csvs

end
