Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :countries, only: [:index, :show]
      resources :types, only: [:index, :show]
      resources :categories, only: [:index, :show]
      resources :pages, param: :name, only: [:index, :show]
      resources :items, only: [:index, :show]
      get 'ping', action: :index, controller: 'ping'
    end
  end
end