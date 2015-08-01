BaltimorePublicArtCommons::Application.routes.draw do

  root 'items#index'

  resources :items, only: [:index, :show]
  resources :artists, only: [:index]
  resources :sessions, only: [:create, :new]
  resources :users, only: [:new, :create] do
    get 'update-password', to: 'users#update_password'
  end

  get 'static_pages/about', to: 'static_pages#about', as: 'about', path: '/about'

  get '/login', to: 'sessions#new', as: 'login'

end
