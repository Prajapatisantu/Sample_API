Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
  resources :magzines
  root 'magzines#index'
end
