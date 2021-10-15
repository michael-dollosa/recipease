Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  

  authenticated :user do 
    resources :searches, only: [:index, :create, :show], path: :search
    post '/search/copy/:id', to: 'searches#copy', as: 'search_copy'
    resources :recipes, only: [:index, :show]
    root "recipes#index"
  end
  root to: "pages#landing_page", as: :unauthenticated_root
end
