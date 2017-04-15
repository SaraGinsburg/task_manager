Rails.application.routes.draw do
  resources :tasks
  resources :lists, only: [:index, :create, :show]

  root "lists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
