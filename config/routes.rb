Librefondo::Application.routes.draw do
  resources :trust_funds
  resources :funds

  resources :payments, only: [:new] do  
    get :more_info
  end

  devise_for :users
  
  resources :users do
    member do
      get :edit_profile
      put :update_profile
    end
  end
  
  root to: redirect('/users/sign_in')
end
