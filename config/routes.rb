Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

namespace :api do
  namespace :v1 do
    resources :athletes, only: [:index, :show, :update, :create]
    resources :results, only: [:index]
  end
end

end
