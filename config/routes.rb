Rails.application.routes.draw do
  devise_for :users

  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'prototypes', to: 'prototypes#index'
  resources :comments, only: [:create]
  resources :users, only: [:show]
  root to: 'prototypes#index'
end
