Rails.application.routes.draw do
  root to: 'pages#home' # have the root_path render the view with the 4 world-entries
  get 'registrations/create'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get "personal_dashboard", to: "pages#personal_dashboard"
  get "admin_dashboard", to: "pages#admin_dashboard", as: "admin_dashboard"
  get "about_us", to: "pages#about_us", as: "about_us"
  get "studios/:studio_id/community", to: "studios#community", as: "community"

  get "students", to: "pages#students_index", as: "students"
  get "teachers", to: "pages#teachers_index", as: "teachers"
  get "teacher", to: "pages#teacher_new", as: "new_teacher"
  post "subscriptions", to: "subscriptions#create"
  patch "subscriptions", to: "subscriptions#update"
  get "subscriptions", to: "subscriptions#edit"
  delete "subscriptions", to: "subscriptions#destroy"

  #delete "subscriptions", to: "subscriptions#destroy"

  resources :users, only: [:show, :edit, :update]

  resources :studios, only: [:show] do
    resources :lessons, only: [:index]
    resources :events
    resources :subscriptions, only: [:index, :new, :create, :destroy]
  end

  resources :notes, only: [:new, :create, :destroy, :edit, :update, :index]
  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :categories do
    resources :posts, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create]
    member do
      get 'show_all_comments'
      get 'show_less_comments'
    end
  end

  # resources :pages, only: [ :admin_dashboard, :personal_dashboard ]

  resources :studios, only: [:edit, :update]

  resources :lessons, except: [:index] do
    resources :bookings, only: [:new, :create, :edit, :update ]
  end

  resources :user_plans, only: [:new, :create, :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
