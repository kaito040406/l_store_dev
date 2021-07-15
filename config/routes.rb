Rails.application.routes.draw do
  root "homes#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :tokens

  get "management", to: "users#management", as: :user_management
  get 'links', to: 'links#index'
  post 'links', to: 'links#create'

end
