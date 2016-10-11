Rails.application.routes.draw do

  devise_for :users
  root to: 'top#index'
  resources :requests
  resources :csvs do
  end

end
