Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit,:update, :destroy] do
    resources :transactions, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
