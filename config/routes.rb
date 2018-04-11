Rails.application.routes.draw do
  root controller: :athletes, action: :index

authenticate :user do
  resources :athletes, shallow: true
  put 'toggle/:id', to: 'athletes#toggle', as: :toggle_voting
  put 'publish', to: 'athletes#publish', as: :publish
end
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new]
      resources :results, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
