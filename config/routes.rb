Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup',to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users,only: [:index,:show,:new,:create]do
    member do
      get :posts
      get :likes
    end
  end
  resources :posts,only: [:index,:show,:create,:destroy]
  resources :favorites,only: [:create,:destroy]
end
 