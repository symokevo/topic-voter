Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :companies do
    resources :company_heads, only: [:index] do
      member do
        patch :approve
        delete :destroy
      end
    end
  end

  root "users#new"
end
