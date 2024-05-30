Rails.application.routes.draw do
  # Static pages
  get 'static_pages/about'
  get "/about", to: "static_pages#about"

  # Devise routes for users with custom registrations and sessions controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'company_heads/sign_up', to: 'company_heads_registrations#new', as: 'new_company_heads_registration'
    post 'company_heads', to: 'company_heads_registrations#create', as: 'company_heads_registration'
  end

  # Other resources
  resources :blog_posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :topics do
    resources :votes, only: [:create]
  end

  resources :companies do
    resources :company_heads, only: [:index] do
      member do
        patch :approve
        delete :destroy
      end
    end
  end

  resources :users, only: [:index, :show]

  # Root route
  root "blog_posts#index"
end
