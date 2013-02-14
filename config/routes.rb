Activos::Application.routes.draw do
  resources :trust_funds
  resources :rates
  resources :funds
  resources :payments
  resources :kinds
  resources :stocks
  
  root to: 'stocks#index'
  devise_for :users
  
  resources :users do
    member do
      get :edit_profile
      put :update_profile
    end
  end
  
  root to: redirect('/users/sign_in')
end
