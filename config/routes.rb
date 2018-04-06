Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new, :edit]
      resources :results, only: [:index]
    end
  end
end
