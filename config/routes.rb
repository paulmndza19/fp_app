Rails.application.routes.draw do
  resources :claim_requests
  resources :claim_request_types
  namespace :admin do
    resources :contributions
    resources :users
    resources :claim_request_types

    root to: "contributions#index"
  end
  resources :contributions

  devise_for :users

  root to: "home#index"
end
