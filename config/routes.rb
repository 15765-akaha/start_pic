Rails.application.routes.draw do
  namespace :admins do
    get 'post_images/index'
  end
# admin
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
# user
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

# admin
  namespace :admins do
  	root 'home#top'
  	resources :themes, only: [:index, :create, :destroy, :edit, :update]
	resources :user_dates, only: [:index, :show, :edit, :update]
	resources :post_images, only: [:index, :destroy]  
  end

# user
  scope module: :users do
	root 'home#top'
  	resources :themes, only: [:index, :show] do
	  resources :post_images, only: [:new, :create]
  	end
  	resources :post_images, only: [:index, :show, :edit, :update, :destroy] do
  	  resource :likes, only:    [:create, :destroy]
  	  resources :image_comments, only: [:create, :destroy]
	end
	get 'tags/:tag', to: 'post_images#index', as: :tag #投稿タグリンクのルーティング
  	resources :users, only: [:show, :edit, :update] do
  	  resource :relationships, only: [:create, :destroy]
  	  member do
  	  	get :withdrow, :follows, :followers, :likes
  	  	patch :switch
  	  end
  	end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
