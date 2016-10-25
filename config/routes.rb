Rails.application.routes.draw do
  root 'locations#index'
  post 'locations/:id' => 'conditions#create'

  resources :locations do
    resources :garments
  end

  namespace :api do
    namespace :v1 do
      resources :conditions, only: [:create]
    end
  end

  resources :users

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end
