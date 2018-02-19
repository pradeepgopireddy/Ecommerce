Rails.application.routes.draw do
	resources :orders
  resources :brands
  resources :addresses
  devise_for :users
	resources :categories
	resources :products
	resources :reviews
	resources :cart_line_items
	resources :wishlists
	root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
