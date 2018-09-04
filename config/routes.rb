Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create] do
    resources :images, only: [:show]
  end
  root 'users#index'
end
