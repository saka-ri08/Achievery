Rails.application.routes.draw do
  devise_for :users

  root "homes#top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks
end
