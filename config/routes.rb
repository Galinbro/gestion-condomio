Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :roles, only: [:index, :edit, :update]
end
