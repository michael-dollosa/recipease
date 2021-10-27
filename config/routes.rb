Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :newsletters, only: [:create, :destroy]
  resources :webhooks, only: [:create]
  authenticated :user do 
    resources :payments, only: [:create]
    get '/payments/success', to: 'payments#success', as: 'payment_success'
    get '/payments/cancelled', to: 'payments#cancel', as: 'payment_cancel'
    resources :searches, only: [:index, :create, :show], path: :search
    post '/search/copy/:id', to: 'searches#copy', as: 'search_copy'
    resources :recipes
    root "recipes#index"
  end
  root to: "pages#landing_page", as: :unauthenticated_root
end
