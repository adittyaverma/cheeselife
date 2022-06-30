Rails.application.routes.draw do
	
	resources :users, param: :_username
	resources :users, path: "restaurants", as: "restaurants"
	resources :menus
	resources :items
	resources :orders, only: [:index, :show, :update]
	post 'create_order', to: 'orders#create_order'

  post '/user/login', to: 'authentication#login'
  post '/restaurant/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
