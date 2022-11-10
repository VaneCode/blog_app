Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Web routes

  devise_for :users # Routes for authentication
 
  root "users#index"  # Defines the root path route ("/")

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # API endpoints routes
  
  namespace :api do # /api
    namespace :v1 do # /api/v1
      resources :users, only: [:show] do # api/v1/users
        resources :posts, only: [:index, :show], format: :json do # api/v1/users/:user_id/posts
          resources :comments, only: [:create, :index], format: :json # api/v1/users/:user_id/posts/:post_id/comments
        end
      end
    end
  end
  
end
