Rails.application.routes.draw do

	root to: 'homes#top'
	get 'homes/about'
	devise_for :users

	get 'coupons/target'
	resources :coupons, only: [:show]

	get 'loans/post'
	get 'loans/next'

	get 'loans/confirm'
	get 'loans/complete'
	resources :loans, only: [:new, :create,:index,:show]

	resources :banks, only: [:index, :show] do
		resource :favorites, only: [:create, :destroy]
		get :favorites, on: :collection
	end

end
