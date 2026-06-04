Rails.application.routes.draw do
  devise_for :users

  root "homes#top"

  get "home", to: "homes#show", as: :home

  resources :tasks

  get "calendar", to: "calendars#show"
  get "calendar/:date", to: "calendar_days#show", as: :calendar_day
  get "free_tasks", to: "free_tasks#index"

  get "up" => "rails/health#show", as: :rails_health_check
end