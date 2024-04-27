Rails.application.routes.draw do
  resources :claim_request_types

  namespace :admin do
    resources :contributions
    resources :users
    resources :claim_request_types
    # resources :claim_requests

    root to: "contributions#index"
  end
  resources :contributions

  devise_for :users

  root to: "home#index"
end
