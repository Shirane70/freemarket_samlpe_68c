Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "informations#index"
  resources :products, only: [:index, :new]
  resources :informations, only: [:index , :show]
  resources :tests, only: :show do
    collection do
      get :done
    end
  end 


  resources :users, only: :index do
    collection do
      get :logout
    end
  end 

  resources :signin_users, only: [:show]

  resources :signup_users, only: [:index, :create] do
    collection do
      get 'step1'
      post 'step2'  #入力が全て完了  #登録完了後
      get 'complete' #登録完了後
    end
  end

  resources :cards , only: [:new, :index, :create]

end
