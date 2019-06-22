Rails.application.routes.draw do

  root to: "application#welcome"

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks", :registrations => "registrations"}
  resources :users, only: [:index, :show, :edit]
  resources :trainings
  resources :instructors
  resources :users do
    resources :trainings
      delete = "taingings#destroy"
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
end
