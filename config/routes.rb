Rails.application.routes.draw do
  get 'registrations/create'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home' # have the root_path render the view with the 4 world-entries
  get "personal_dashboard", to: "pages#personal_dashboard"
  get "admin_dashboard", to: "pages#admin_dashboard"
  get "studios/:studio_id/community", to: "studios#community", as: "community"

  resources :studios, only: [:show] do
    resources :lessons, only: [:index]
    resources :events, only: [:new, :create]
    resources :subscriptions, only: [:index, :new, :create]
  end

  resources :notes, only: [:create, :destroy]
  resources :orders, only: [:show, :create]

  resources :categories do
    resources :posts, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create]
  end

  # resources :pages, only: [ :admin_dashboard, :personal_dashboard ]

  resources :studios, only: [:edit, :update]

  resources :lessons, except: [:index] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
