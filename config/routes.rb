Rails.application.routes.draw do
  resources :roles
  resources :claim_request_types

  namespace :admin, admin: true do
    resources :contributions
    resources :roles
    resources :users
    resources :claim_request_types
    resources :claim_requests, only: %i[
      index
      edit
      update
      show
    ]

    root to: "contributions#index"
  end
  resources :contributions
  resources :claim_requests, only: [:index, :new, :create]

  devise_for :users

  root to: "home#index"
end
