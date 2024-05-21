Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "blog_posts#index"

  resources :blog_posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :topics do
    resources :votes, only: [:create]
  end

  resources :users, only: [:new, :create]
  resources :company_heads_registrations, only: [:new, :create]

  resources :companies do
    resources :company_heads, only: [:index] do
      member do
        patch :approve
        delete :destroy
      end
    end
  end

  # Routes for user login and logout
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
