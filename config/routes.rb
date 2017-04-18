Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resources :lists, only: [:index, :create, :show] do
    resources :tasks, only: [:create, :update, :destroy]
  end

  authenticated :user do
    root 'lists#index'
  end
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
