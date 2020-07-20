Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :sports, param: :slug, only: [:index] 
      resources :measurements, only: [:index, :create, :destroy, :show] 
      resources :progresses, only: [:index] 
    end
  end
end
