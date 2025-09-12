Rails.application.routes.draw do
  resources :genres

  root "movies#index"
  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  resource :session, only: [ :new, :create, :destroy ]
  get "signin" => "sessions#new"

  resources :movies do
    resources :reviews
    resources :favorites
  end

  resources :users
  get "signup" => "users#new"

end
