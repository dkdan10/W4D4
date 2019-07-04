Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new, :index] do
    resource :tracks, only: [:new]
  end
  resources :tracks, except: [:new, :index]
end
