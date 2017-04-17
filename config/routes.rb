Rails.application.routes.draw do

  devise_for :users
  resources :lists, only: [:index, :create, :show] do
    resources :tasks, only: [:create, :update, :destroy]
  end

  root "lists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
