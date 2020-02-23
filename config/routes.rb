Rails.application.routes.draw do
  namespace :admins do
    get 'user_dates/index'
    get 'user_dates/show'
    get 'user_dates/edit'
    get 'user_dates/update'
  end
  namespace :admins do
    get 'themes/index'
    get 'themes/create'
    get 'themes/destroy'
    get 'themes/edit'
    get 'themes/update'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
