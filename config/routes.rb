Rails.application.routes.draw do

  root to: "application#welcome"

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks", :registrations => "registrations"}
  resources :users, only: [:index, :show, :edit]
  resources :trainings
  resources :instructors
  resources :users do
    resources :trainings
      delete = "traingings#destroy"
  end
end
