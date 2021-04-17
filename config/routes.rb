Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :record, only: [:index, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
