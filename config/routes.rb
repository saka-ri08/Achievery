Rails.application.routes.draw do
  devise_for :users

  root "homes#top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :diaries do
    resources :tasks, only: [:create, :update, :destroy]
  end
end
