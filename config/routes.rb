Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
    resources :teams
    resources :videos
    resources :admin_users

    root to: "users#index"
  end

  resources :teams
  resources :posts do
    resources :videos
  end
  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
