Rails.application.routes.draw do
  devise_for :users 
  root 'ideas#index'
  resources :ideas, only: [:new, :create, :show, :destroy]
end
