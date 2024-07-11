Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  resources :dancers, only: [:new, :create, :show, :edit, :update, :index] do
    resources :auditions, only: [:index]
  end

  resources :producers, only: [:new, :create, :show, :edit, :update, :index] do
    resources :castings, only: [:new, :create, :show, :edit, :update, :index] do
      resources :auditions
    end
  end

  resources :castings, only: [:index, :show, :edit, :update, :destroy] do
    resources :auditions
  end

  resources :auditions, only: [:index, :show] do
    resources :videos, only: [:create, :destroy]
    resources :dancer_auditions, only: [:create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
