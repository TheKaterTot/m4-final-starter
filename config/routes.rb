Rails.application.routes.draw do
  root to: "links#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :links, only: [:index, :new, :create]
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
