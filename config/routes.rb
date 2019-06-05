Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # possibly change this later, maybe personal dashboard?
  get "personal_dashboard", to: "pages#personal_dashboard"
  get "admin_dashboard", to: "pages#admin_dashboard", as: "admin"
  get "studio/:id/community", to: "studios#community", as: "community"

  get "students", to: "pages#students_index", as: "students"
  get "teachers", to: "pages#teachers_index", as: "teachers"
  get "teacher", to: "pages#teacher_new", as: "teacher"
  post "subscriptions", to: "subscriptions#create"

  resources :users, only: [:show, :edit, :update]


  resources :studio, only: [:show] do
    resources :lessons, only: [:index]
    resources :events, only: [:new, :create]
    resources :subscriptions, only: [:index, :new, :create]

  end

  resources :notes, only: [:create, :destroy]
  resources :orders, only: [:show, :create]

  resource :categories do
    resources :posts, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create]
  end

  # resources :pages, only: [ :admin_dashboard, :personal_dashboard ]

  resources :studio, only: [:edit, :update]

  resources :lessons, except: [:index] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
