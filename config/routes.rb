Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "informations#index"

  resources :informations, only: [:index , :show, :destroy]
  

  resources :users, only: :index do
    collection do
      get :logout
    end
  end 

  resources :signin_users, only: [:show]

  resources :signup_users, only: [:index, :create] do
    collection do
      get 'step1'
      post "step1"
      post 'step2'  #入力が全て完了  #登録完了後
      get 'complete' #登録完了後
    end
  end


  resources :items, only: [:index, :new, :show, :create, :edit, :update] do
    collection do
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get "done"=> 'items#done', as: 'done'
    end
  end

  resources :cards , only: [:new, :show, :create, :destroy, :index] do
    collection do
      get 'done'
    end
  end

end