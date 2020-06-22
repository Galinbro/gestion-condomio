Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'
  resources :users, except: [:show]
  root 'welcome#index'

  #resources :roles, only: [:index, :edit, :update]
end
