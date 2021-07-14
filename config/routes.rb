Rails.application.routes.draw do
  devise_for :users
  # root to: 'management'
  get "management", to: "users#management"
  get 'links', to: 'links#index'
  post 'links', to: 'links#create'
  post 'users/logout', to: "users#session"

  resources :tokens

end
