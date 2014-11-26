Rails.application.routes.draw do

  root :to => "cards#index"
  
  resources :cards do
    collection do
      put 'remove'
    end
  end
  
  resources :accounts do
    collection do
      get 'options'
      get 'withdraw'
      get 'deposit'
      get 'account'
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
