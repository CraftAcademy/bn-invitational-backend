Rails.application.routes.draw do
  root controller: :athletes, action: :index

  resources :athletes
  put 'toggle/:id', to: 'athletes#toggle', as: :toggle_voting




  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new]
      resources :results, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
