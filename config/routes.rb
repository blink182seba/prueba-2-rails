Rails.application.routes.draw do
  get 'orders/create'
  resources :tasks, only: :index do
    resources :orders, only: :create
  end
  resources :orders do
    collection do
      get 'completed'
    end
  end
  root to: 'tasks#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
