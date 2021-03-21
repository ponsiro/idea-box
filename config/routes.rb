Rails.application.routes.draw do
  devise_for :users 
  root 'ideas#index'
  resources :ideas do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
