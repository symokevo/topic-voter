Rails.application.routes.draw do
  get 'company_heads_registrations/new'
  get 'company_heads_registrations/create'
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
