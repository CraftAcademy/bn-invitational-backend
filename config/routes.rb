Rails.application.routes.draw do
  root controller: :athletes, action: :index
  resources :athletes
  # match '/athletes/:id', to: "athletes#update", via: [:get, :post]
  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new]
      resources :results, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
