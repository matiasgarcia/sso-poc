Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  get :secret, to: 'home#secret'
  resources :users, only: [] do
    collection do
      get :me
    end
  end
  root to: 'home#index'
end
