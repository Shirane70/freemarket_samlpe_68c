Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "informations#index"
   root to: "users#howToPay"
   #get 'users/logout' to: 'user#logout'
  resources :informations, only: [:index , :show]
  # resources :users, only: [:index]
  resources :tests, only: [:show]
  resources :users do
    collection do
      get :logout
      get :howToPay
    end
  end 
end
