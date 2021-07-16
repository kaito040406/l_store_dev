Rails.application.routes.draw do
  root "homes#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :tokens

  get "management", to: "users#management", as: :user_management
  get 'messages', to: 'messages#index'
  post 'messages', to: 'messages#create'

end
