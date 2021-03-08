Rails.application.routes.draw do
  devise_for :users
  get 'search', to: "boyfriends#search", as: "search"
  get 'dashboard', to: "boyfriends#dashboard", as: "dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boyfriends, only: %i[show create new] do
    collection do
      get :search
    end
    resources :reservations, only: %i[create edit]
  end
  resources :boyfriends, only: %i[show] do
    collection do
      get :ville
    end
  end
  resources :reservations, only: %i[destroy]
  root to: 'boyfriends#index'
end
