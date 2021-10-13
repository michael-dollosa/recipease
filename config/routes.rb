Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :searches, only: [:index, :create, :show], path: :search
  root "pages#landing_page"
end
