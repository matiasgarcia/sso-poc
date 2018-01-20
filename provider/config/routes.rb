Rails.application.routes.draw do
  devise_for :users
  get :secret, to: 'home#secret'
  root to: 'home#index'
end
