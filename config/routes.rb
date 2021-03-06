Rails.application.routes.draw do

  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  get 'homes/about'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users/check'
  patch 'users/withdraw'

  get 'loans/next'
  get 'loans/confirm'
  get 'loans/complete'
  resources :loans, only: [:new, :create,:index,:show]

  get 'coupons/target'
  resources :coupons, only: [:show, :index]

  resources :banks, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
    get :favorites, on: :collection
  end

end
