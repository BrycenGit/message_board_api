Rails.application.routes.draw do

  get 'registrations/create'
  # devise_for sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :messages
  end

  resources :messages

  resources :sessions, only: [:create, :destroy]

  resources :registrations, only: :create
end
