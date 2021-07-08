Rails.application.routes.draw do
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "home#index"
  resources :home
end
