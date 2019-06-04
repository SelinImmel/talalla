Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # possibly change this later

  resources :studio, only: [:show] do
    resources :lessons, only: [:index, :show, :delete, :edit, :update]
    resources :events
    resources :subscriptions, only: [:index]
  end

  resource :user, only: [:show, :edit, :update, :delete] do
    resources :notes
    resources :bookings, except: [:edit, :update]
    resources :orders,  only: [:show, :create]
    resources :user_plan, only: [:index]
  end

  resource :categories do
    resources :posts
  end

  resources :posts, only: [] do
    resources :comments
  end

  resources :pages, only: [ :admin_dashboard ]

  resources :subscriptions
  resources :studio, only: [:edit, :update]
  resources :lessons
  resources :bookings, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :user_plans, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
