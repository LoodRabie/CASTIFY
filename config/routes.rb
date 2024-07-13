Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  resources :dancers, only: [:new, :create, :show, :edit, :update, :index] do
    resources :auditions, only: [:index]
  end

  resources :producers, only: [:new, :create, :show, :edit, :update, :index] do
    resources :castings, only: [:new, :create, :index]
  end

  resources :castings, only: [:show, :edit, :update] do
    resources :auditions, except: [:show]
  end

  resources :auditions, only: [:show] do
    resources :videos, only: [:create, :destroy]
    resources :dancer_auditions, only: [:create, :destroy]
  end

  get 'my_auditions', to: 'dancers#my_auditions', as: 'my_auditions'

  get "up" => "rails/health#show", as: :rails_health_check
end
