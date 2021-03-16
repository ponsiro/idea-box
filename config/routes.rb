Rails.application.routes.draw do
  devise_for :users 
  root 'ideas#index'
  resources :ideas do
    resources :comments, only: :create
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
