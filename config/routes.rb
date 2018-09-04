Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show] do
    resources :images, only: [:index, :update]
  end
  root 'users#index'
end
