Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  root to: "home#index"

  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions: "users/sessions" 
  }
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    resources :posts, only: :index
  end
end
