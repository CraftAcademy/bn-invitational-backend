Rails.application.routes.draw do
  root controller: :athletes, action: :index

  resources :athletes, only: [:index, :new, :create]
  put 'toggle/:id', to: 'athletes#toggle', as: :toggle_voting
  put 'publish', to: 'athletes#publish', as: :publish

  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new]
      resources :results, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
