Rails.application.routes.draw do

	root to: 'homes#top'
	get 'homes/about'
	devise_for :users

	get 'coupons/target'
	resources :coupons, only: [:show]

	get 'attribute_posts/post'
	resources :attribute_posts, only: [:new, :create]

	get 'attribute_bank_posts/comfirm'
	get 'attribute_bank_posts/complete'
	resources :attribute_bank_posts, only: [:index]

	resources :bank_posts, only: [:new, :create, :index, :show] do
		resource :favorites, only: [:create, :destroy]
		get :favorites, on: :collection
	end

end
