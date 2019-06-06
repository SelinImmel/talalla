Rails.application.routes.draw do
  root to: 'pages#home' # have the root_path render the view with the 4 world-entries
  get 'registrations/create'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get "personal_dashboard", to: "pages#personal_dashboard"
  get "admin_dashboard", to: "pages#admin_dashboard", as: "admin_dashboard"
  get "studios/:studio_id/community", to: "studios#community", as: "community"

  get "students", to: "pages#students_index", as: "students"
  get "teachers", to: "pages#teachers_index", as: "teachers"
  get "teacher", to: "pages#teacher_new", as: "new_teacher"
  post "subscriptions", to: "subscriptions#create"
  #delete "subscriptions", to: "subscriptions#destroy"

  resources :users, only: [:show, :edit, :update]

  resources :studios, only: [:show] do
    resources :lessons, only: [:index]
    resources :events
    resources :subscriptions, only: [:index, :new, :create, :destroy]
  end

  resources :notes, only: [:create, :destroy]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

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

  resources :user_plans, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
