Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :services do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :bookings, only: [:destroy]
end
