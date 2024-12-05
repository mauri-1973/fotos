Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :photos do
    resources :comments, only: [:create]
  end
  root to: 'photos#index'
end
