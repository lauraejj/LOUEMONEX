Rails.application.routes.draw do
  devise_for :users

  get 'search', to: "boyfriends#search", as: "search"
  delete 'boyfriends/:id', to: 'boyfriends#destroy', as: 'delete_boyfriend'
  # patch 'boyfriends/:id', to: 'boyfriends#update', as: 'update_boyfriend'

  get 'reservations/dashboard', to: "reservations#dashboard"
  get "confirmation", to:'boyfriends#confirmation', as: 'confirmation'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boyfriends, only: %i[show create new edit update destroy] do
    collection do
      get :search
    end
    resources :reservations, only: %i[create]
  end
  resources :boyfriends, only: %i[show] do
    collection do
      get :ville
    end
  end
  resources :reservations, only: %i[destroy update]
  root to: 'boyfriends#index'
end
