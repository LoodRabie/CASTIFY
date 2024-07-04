Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :dancers, only: [:show, :edit, :update, :index] do
    resources :auditions, only: [:index]
  end

  resources :producers, only: [:show, :edit, :update, :index] do
    resources :castings, only: [:new, :create] do
      resources :auditions, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  end

  resources :castings, only: [:index, :show, :edit, :update, :destroy] do
    resources :auditions, only: [:index, :show]
  end

  resources :auditions, only: [:index, :show] do
    resources :videos, only: [:create, :destroy]
    resources :dancer_auditions, only: [:create, :destroy]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
