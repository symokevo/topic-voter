Rails.application.routes.draw do
  root "topics#index"

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
end
