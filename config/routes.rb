Rails.application.routes.draw do
  resources :registrations, only: [:new, :create]

  resources :topics do
    resources :votes, only: [:create]
  end

  resources :users, only: [:new, :create]

  resources :companies do
    resources :company_heads, only: [:index] do
      member do
        patch :approve
        delete :destroy
      end
    end
  end

  root "topics#index"
end
