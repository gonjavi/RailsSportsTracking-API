Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :sports, param: :slug, only: [:index]
      resources :measurements, only: %i[index create destroy]
      resources :progresses, only: %i[index]
    end
  end
end
