Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "events#index"
  resources :events, only: [:new, :create, :index]
  resources :users
end
