Rails.application.routes.draw do
  resources :posts, except: [:index]
  resources :subs
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect("session/new")
end
