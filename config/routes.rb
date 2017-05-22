Rails.application.routes.draw do
  root to: "links#index"
  get '/login', to: "sessions#new"

  resources :links, only: [:index]
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
