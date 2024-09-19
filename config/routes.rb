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
    resources :sales_categories
    resources :daily_sales, except: %i[destroy]

    resources :expense_categories
    resources :daily_expenses, except: %i[destroy]

    resources :tenants
    resources :late_tenants
    resources :stalls
    resources :stall_rentals
    resources :rental_payments

    resources :sales_reports, only: [:index]
    get "/sales_reports_xlsx", to: "sales_reports#download_excel"


    root to: "contributions#index"
  end
  resources :contributions
  resources :claim_requests, only: [:index, :new, :create]
  resources :audit_trails, only: [:index], :path => :activity_log
  resources :archives, only: [:index]

  devise_for :users

  root to: "home#index"
  get "/dashboard", to: "home#dashboard"

  get "/bylaws", to: "bylaws#index"
  get "/sales", to: "sales#index"
  get "/expenses", to: "expenses#index"
end
