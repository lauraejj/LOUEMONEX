Rails.application.routes.draw do
  devise_for :users
  get 'search', to: "boyfriends#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boyfriends, only: %i[show create new] do
    collection do
      get :search
    end
    resources :reservations, only: %i[create new]
  end
  resources :reservations, only: [ :destroy ]
  root to: 'boyfriends#index'
end
