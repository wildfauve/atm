Rails.application.routes.draw do

  root :to => "cards#index"
  
  resources :cards
  
  resources :accounts do
    collection do
      get 'options'
      get 'withdraw'
      get 'deposit'
      post 'transaction'
    end
  end
  
  
  resources :identities, only: [:index] do
    collection do
      get 'sign_up'
      get 'login'
      get 'authorisation'
      put 'logout'
    end
  end
  
  
end
