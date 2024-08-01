Rails.application.routes.draw do
  root 'books#index'

  devise_for :accounts, controllers: { registrations: 'users/registrations' }

  resources :books do
    resources :carts, only: %i[create destroy]

    resources :orders do
      collection do
        get 'users_orders'
      end
    end
  end

  resources :authors

  resources :users, only: %i[index destroy]
end
