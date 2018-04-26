Rails.application.routes.draw do
  root controller: :athletes, action: :index

authenticate :user do
  resources :athletes, shallow: true
  put 'toggle/:id', to: 'athletes#toggle', as: :toggle_voting
  put 'publish', to: 'athletes#publish', as: :publish
  put 'revert', to: 'athletes#revert', as: :revert_results
  post 'push', to: 'athletes#custom_push_notification', as: :push_notification
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
