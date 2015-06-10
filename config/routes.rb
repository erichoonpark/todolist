Rails.application.routes.draw do
  devise_for :users
  resources :users do

    resources :items, only: [:new, :create, :show, :destroy]
  end

  get 'welcome/index'

  # Authenticated Users:
    authenticated :user do
      root to: 'users#show', as: :authenticated_root
    end

    # Non-Authenticated Users
    root to: 'welcome#index'
end
