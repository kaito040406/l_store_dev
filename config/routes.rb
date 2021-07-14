Rails.application.routes.draw do
  devise_for :users
  # root to: 'management'
  get "management", to: "users#management"
  get 'links', to: 'links#index'
  post 'links', to: 'links#create'
  post 'users/logout', to: "users#session"


  resources :users do
    resources :tokens
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
