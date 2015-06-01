Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :items, only: [:new, :create, :show]
  end

  get 'welcome/index'
  root :to => 'welcome#index'
end
