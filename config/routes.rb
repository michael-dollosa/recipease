Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :newsletters, only: [:create, :destroy]
  authenticated :user do 
    resources :payments, only: [:create]
    resources :webhooks, only: [:create]
    resources :searches, only: [:index, :create, :show], path: :search
    post '/search/copy/:id', to: 'searches#copy', as: 'search_copy'
    resources :recipes
    root "recipes#index"
  end
  root to: "pages#landing_page", as: :unauthenticated_root
end
