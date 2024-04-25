Rails.application.routes.draw do
  namespace :admin do
    resources :contributions
    resources :users

    root to: "contributions#index"
  end
  resources :contributions

  devise_for :users

  root to: "home#index"
end
